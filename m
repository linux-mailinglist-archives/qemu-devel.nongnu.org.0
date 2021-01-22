Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87E8300673
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:03:01 +0100 (CET)
Received: from localhost ([::1]:37466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xxk-0007uh-JT
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2xvE-0006y9-Ts
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:00:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2xv5-0003i9-5n
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611327613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XHT+Gu/9PO2NHax5FeMqYb+xHlvC+lF8nW0BjABKoM=;
 b=Cfuf1iDcSfinRibuRZXEoDNFfwDdalvV3K1hn2afePpop5RlIk7XwwENbt844DlYuP77os
 qV7bDvhHJfsQUhq9NEg65cJX7GlInlJ10t85wWHS5o/jHtHO3IyY0CxLpB1HlqW7fqmXIK
 PDq4htXCvyWJWje3DgEO+CEjYxm+XEg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-3mozGvLgM96Yjfkq9SbOaw-1; Fri, 22 Jan 2021 10:00:11 -0500
X-MC-Unique: 3mozGvLgM96Yjfkq9SbOaw-1
Received: by mail-ej1-f71.google.com with SMTP id rl8so2294794ejb.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 07:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7XHT+Gu/9PO2NHax5FeMqYb+xHlvC+lF8nW0BjABKoM=;
 b=bj84bmPKa476jRa2a6TatIt0IGkCdorkmmtPvSkoNRtR7G7pIvX5tId4/Jcw1E9Nvk
 apwugnH91M8Y52pX2VMAN3K97jl6ult636H0xwppq+c/CjwVC4hPaBbZzBuYozXGEI6U
 Ro2RFvblEcBzWFtUOY7GiwkDkN0WdmD2cYiw1SX0Yre8Q1r5mCE6QaK9JkthXTf4z4Zd
 +kqe7jFqfGdMQbd8KGR5dbl+32tklyPqNJfd95/nu6xPDqpoVlXaMeNQpKwJ14vUeKQA
 OXnvkW4NAkPFq9cLtzUhupZwp+S2eOKrPDdQwN9UuzAGR8ML4/Yo/H5F9yeqgLogeGzB
 P9eA==
X-Gm-Message-State: AOAM530YCRkciHBYSw6UPc67Uz026/TdKC5MehUHqs3Vc0BFzLdgVKPs
 /v/7FdZR1kIgz2bcSU5D7wIfda18du+x3Du+bPZk0O8BOYJgs6GzemGyuW5pRqGJGLPiAx7yPTt
 dLYimtaDlqrsSWsGOqVQZYUH3dx5r00mOn0x6wYYTkgYP7As05ckATD+cWii7kXjO118=
X-Received: by 2002:a17:907:3f1f:: with SMTP id
 hq31mr3271826ejc.205.1611327610020; 
 Fri, 22 Jan 2021 07:00:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMGESsz1XzmEvbq9iI9iZhfwLKk+S3bfrugf5oIa3o1CALmLrUCTO8A7kPoTWSKpQgurURSg==
X-Received: by 2002:a17:907:3f1f:: with SMTP id
 hq31mr3271807ejc.205.1611327609794; 
 Fri, 22 Jan 2021 07:00:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id bl13sm4631398ejb.64.2021.01.22.07.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 07:00:08 -0800 (PST)
Subject: Re: [PATCH 05/25] keyval: simplify keyval_parse_one
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-6-pbonzini@redhat.com>
 <874kj95bhd.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <84476bff-27ba-4308-cd9f-cbc1dc233831@redhat.com>
Date: Fri, 22 Jan 2021 16:00:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <874kj95bhd.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/21 14:48, Markus Armbruster wrote:
>    --nbd .key=
> 
>      master:       Invalid parameter '..key'
>      your patch:   same
> 
>      Likweise.
> 
>    If I omit the '=', your patch's message changes to
> 
>                    No implicit parameter name for value 'key..'
> 
>    I consider that worse than before, because it's talking about
>    something outside the user's control (lack of an implict parameter
>    name) where it should instead tell the user what needs fixing in the
>    input.

I think whether it's better or worse depends on the specific erroneous 
command line (think "--nbd /path/to/file.qcow2"), but I can certainly 
change it.

> Your patch also adds an "Expected parameter at end of string" error.
> Can you tell me how to trigger it?

It is meant for "--nbd ''" but it is effectively dead code due to the 
"while (*s)" in the caller.  Possibilities:

1) leave it in as dead code

2) replace it with an assert

3) change the caller to use a do...while in such a way that it triggers 
it (and be careful not to change the grammar).

> I believe your grammar is ambiguous.  Your code seems to pick the sane
> alternative.  If I'm wrong, you need to enlighten me.  If I'm right, you
> need to fix your grammar.

Will do.  Can I change the EBNF to use "+" and "*" for simplicity and 
clarity?

> Hmm, bartering opportunity...  May I have your support for me
> eliminating anti-social device names in exchange?  

I do not mind removing them.  What's the barter exactly like? :)

Paolo


