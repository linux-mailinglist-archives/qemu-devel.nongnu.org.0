Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0942BB096
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:31:57 +0100 (CET)
Received: from localhost ([::1]:43492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9KG-0005kj-2u
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg9GO-0001Wb-Uf
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:27:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg9GM-0006dd-9R
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605889673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a3dsOLXxEYuu1HXYpqYdqwrDFFTkbbF8WHq197XFZNw=;
 b=DPFVuVjOTqUDyaMOURDTq0DDAtYCkPy3n5kJ2xBnq5IQH21ZrdZEmiwl4b6ytU73copJVh
 5Ai1wnneeEcjXoKUky1IGYwtA1V3E35L6mJXRXICNQIrWYOpqXUfPeiQ3+ss/9HlSDKPkA
 bitvNxFp0aooPCJ4F2QtuG/hAAuJSWg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-GGdRwUkYNCa2k0YeQGwqSQ-1; Fri, 20 Nov 2020 11:27:51 -0500
X-MC-Unique: GGdRwUkYNCa2k0YeQGwqSQ-1
Received: by mail-ed1-f72.google.com with SMTP id v7so3998933edy.4
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:27:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a3dsOLXxEYuu1HXYpqYdqwrDFFTkbbF8WHq197XFZNw=;
 b=ZUAsEJVf3pZYt5AC/k4NxGlKKnJUksTYGf0k/9T9mrEm/H/ATDSYz+yfm70JbCDdh7
 l8w24UQ8N47urmnXtaW1zRSJhBPLCIIE+w+FQ9EC1XQXQzonEtv47YcE0BhlwLeDiUJG
 ULN7mrT2JcMJ2mh9GIm2ifeLowSUO0LmqharUKtCxo+Q3tgftyqI/j3OBIDpAJm+Aags
 836i6AnXpWZVqQ4GOcoIdHSi7tJumQ1j7nQDEaATSQaenMOtvxIa48byGySF1V7XN4lw
 sHK/DcyndspRCfJxmiTYbmoJlOBFzOaDjeUqIm28LfA2eclMuUwREsGtEkCL7UnuS8ld
 AOQw==
X-Gm-Message-State: AOAM531abdVBOSiMfKrzHrhxIXlPECCWT1J/fmHHGgElG8MKy8gG6dtW
 qjofrm5HWkI1hkoBaqDtCFpGurX57gPNxVuy55Sl0bVUAWCpXSH3GQx4I9U2pMM4XPU5XOoE+w/
 jQVb5uz/x2S6qbSQ4mfuQmJVrfO10h0d4K7e3SENiU7R/vyMxOu1pOqcup9/1WCdXQUU=
X-Received: by 2002:aa7:cc0e:: with SMTP id q14mr36359449edt.181.1605889670303; 
 Fri, 20 Nov 2020 08:27:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiRLC7+m9C7wefk5MksoO9IuIdRBBNLwWn4yvVd0dxhCBDGZuXcaINIDpatP+ku/u8OQeexw==
X-Received: by 2002:aa7:cc0e:: with SMTP id q14mr36359428edt.181.1605889670078; 
 Fri, 20 Nov 2020 08:27:50 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id la9sm1286085ejb.121.2020.11.20.08.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 08:27:49 -0800 (PST)
Subject: Re: [RFC PATCH v2 00/37] cleanup qemu_init and make sense of command
 line processing
To: Igor Mammedov <imammedo@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201102165756.69540720@redhat.com>
 <6c08fbaa-57aa-b2da-c90a-6b53f628806a@redhat.com>
 <20201103135735.029c9b6d@redhat.com>
 <13f14d6c-e52a-390c-7940-9df2e220113e@redhat.com>
 <20201120171927.3179568e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8d9e40ad-486b-5349-bc30-d5499d075074@redhat.com>
Date: Fri, 20 Nov 2020 17:27:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120171927.3179568e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 17:19, Igor Mammedov wrote:
> On Tue, 3 Nov 2020 15:37:13 +0100
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> On 03/11/20 13:57, Igor Mammedov wrote:
>>>> It's based on 20201026143028.3034018-1-pbonzini@redhat.com (which you
>>>> should be able to get through patchew).
>>> Not sure what you mean and how to do that.
>>> Is it possible to share v2 as a git tree somewhere?
>>
>> I pushed it to for-6.0 on my gitlab repo.  There's a lot more stuff in
>> the branch, but these patches are at the top.
> 
> had to use temporary fixup, to make build pass and fix '-device help' crash
> with your branch. (upstream master doesn't have this problem)
> 
> diff --git a/util/qemu-option.c b/util/qemu-option.c
> index 858860377b..78f3397736 100644
> --- a/util/qemu-option.c
> +++ b/util/qemu-option.c
> @@ -776,6 +776,7 @@ static const char *get_opt_name_value(const char *params,
>           /* found "foo,more" */
>           if (help_wanted && starts_with_help_option(params) == len) {
>               *help_wanted = true;
> +            return NULL;
>           } else if (firstname) {
>               /* implicitly named first option */
>               *name = g_strdup(firstname);

Thanks!  I'll integrate this in the right place of the series.

Paolo


