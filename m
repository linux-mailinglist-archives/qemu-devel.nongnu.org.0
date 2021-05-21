Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF2838CBD1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:17:25 +0200 (CEST)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8m4-0004ol-0O
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lk8jg-0002Ul-Ow
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:14:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lk8je-00013w-7k
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUF0uNmE7Ub+zJltytInTt6P4cslqbjXacCqS1n6qfg=;
 b=KVehFeFrafKx1PcyL9gjOy/yqFXN+N/cdczrFhqCYRvZmVAsqFpfFOarmi3H8e/43Vwo1h
 +QkiTF5uxZGMZVNCQv2wkWP+i3WxlUOdGm4u8LPU6cuMv7Ho5U6fPJIDsYIMo0zLilkOLO
 yv8pf66vdDjzypPw7+SG6cqm+oIZWj8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-5xWSeDWtPX2zYrThxJ9xPg-1; Fri, 21 May 2021 13:14:50 -0400
X-MC-Unique: 5xWSeDWtPX2zYrThxJ9xPg-1
Received: by mail-qk1-f199.google.com with SMTP id
 d15-20020a05620a136fb02902e9e93c69c8so17143585qkl.23
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 10:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RUF0uNmE7Ub+zJltytInTt6P4cslqbjXacCqS1n6qfg=;
 b=BtQ0jaKxU9ZYXzi0LTQsCd5aO+Da4+kMISXQusVMjP3UTG8aQ8snEvSifOc+nJEa5r
 aA8izCV9kL5K11BSEKGQSi+AIMbpKtUyoGLvg0RJzFx4EnB3TqEcjyN5zeIonho6s57F
 M1a0Wi6VpAvSDEYMe6y1mcR+QALb2ZvC8rkv0D9Gu8X3WSAvbZh9MNHZwJQNV78DrEsF
 oN55cFUtNax+WV7mHLHfMpm9ge+LOpwEihhuaGu9wCocdBHjjthXy+sIiGs4GADw5W3S
 c2/osn0AaAagHbjkglgnd0CfPt7Kb4eH84go228lyQsqLx6GQbfjVDSTQArh5NXxH3II
 setg==
X-Gm-Message-State: AOAM532XIhdcMaul8J3tEE3q6nHAyQVYJ6AslgJE1r7rOGzUb5ljCmWq
 3SgH8HSJU0V2f8DT0hFQ2ozRtyif/DPHoaFTPwFeicdPhbMpV6rE4DATPoAsNA/PBS7ko5HxzOS
 p/etezJr5v0uadJc=
X-Received: by 2002:a37:45c3:: with SMTP id
 s186mr13169796qka.318.1621617289522; 
 Fri, 21 May 2021 10:14:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNl4+/BxvL1WbVfVi/rtvTGZA8NgYcq33HoUS8VvozRvmx2Fq4XsNwp9hPTqgR7ydumzHCUQ==
X-Received: by 2002:a37:45c3:: with SMTP id
 s186mr13169772qka.318.1621617289266; 
 Fri, 21 May 2021 10:14:49 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id n23sm5168409qke.0.2021.05.21.10.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 10:14:48 -0700 (PDT)
Date: Fri, 21 May 2021 13:14:47 -0400
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: A bug of Monitor Chardev ?
Message-ID: <YKfqh+v3IuzkKJcX@t490s>
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
 <CAJ+F1C+4URqrZvAiBk+o-Ei4etL_oBtdPr0cugGmnMaYaZqGyA@mail.gmail.com>
 <YKU/k/DIJd6gMLvw@redhat.com> <87lf88pmyn.fsf@dusky.pond.sub.org>
 <YKfHGC79w0uv41Zd@t490s> <YKfg6j4mPjvjSrcF@redhat.com>
 <YKfmLgz59nv5Ef5u@redhat.com>
 <CAJ+F1CL_fTN8W2McRA-XXmY6HTy47GZdHz8aB4wxee_7hnyL2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CL_fTN8W2McRA-XXmY6HTy47GZdHz8aB4wxee_7hnyL2g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chenjiashang@huawei.com,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 08:59:17PM +0400, Marc-André Lureau wrote:
> What about my earlier suggestion to add a new
> "qemu_chr_be_disable_handlers()" (until update_read_handlers is called
> again to enable them and the set a different context)?

Yes this sounds both clean and easy indeed (while the other "wait BH run"
approach might be unclean from that pov as we need to do it manually with a
semaphore or something in both the BH and the main thread..).

-- 
Peter Xu


