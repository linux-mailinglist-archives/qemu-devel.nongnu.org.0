Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B6734C8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 19:14:27 +0200 (CEST)
Received: from localhost ([::1]:53632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqKqP-0000aP-4c
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 13:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39595)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jusual@redhat.com>) id 1hqKLi-0007l9-VT
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 12:42:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jusual@redhat.com>) id 1hqKLh-0007q2-PA
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 12:42:42 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35849)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jusual@redhat.com>) id 1hqKLh-0007li-Ef
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 12:42:41 -0400
Received: by mail-wm1-f68.google.com with SMTP id g67so38121953wme.1
 for <qemu-devel@nongnu.org>; Wed, 24 Jul 2019 09:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0S/GMqkxurNcMey8NUQ5hocK9kUPEYZq+sEaJ1Z2Uu0=;
 b=speBJQDiyLX6VU0mxD/fF39DZY40Y38m15/DXKcMfsWzB8wL2rxhrt3Uhe9iMeCezW
 XkWbt/JvogxaLRxUn/yIVw1wKtSvBoABxTQndWI0Vdbt0dNfkAOoWvqw0bmB+P10vuJP
 yprEcxrc8Biny4njIVmmEp/Kr99Paax5IK+CmupmRxCYZaEfGvq9ChMRcpzlbLG+9/2x
 ps9J4NEllpjy4vhB2rRin4g9c5/yJDzkXjJJj2+0B+4Q7vbrUfSTlt5vEP8I8BsNonYL
 KKml8MH1FzbIYEgWDlSmkRwINZ7xSYScAoSOvHvSpVPN4IOkCdi9TKbj+nKKKFdGKxki
 kspQ==
X-Gm-Message-State: APjAAAXXV4/HPdsw6l8pgF51oqDSL6Xd4rSjjCUG5eplhHVVxiryOcXQ
 /kNsUUNLseMDrmPk6dM8bmvgNA==
X-Google-Smtp-Source: APXvYqxg+AGLnyAr8Fd7x6V8pLq91n//Ejif/4yEjyHPn2BNWa9ovl3trWwOW14a3wq9ytnValnuKQ==
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr78787696wmj.44.1563986559813; 
 Wed, 24 Jul 2019 09:42:39 -0700 (PDT)
Received: from localhost.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id y10sm39124643wmj.2.2019.07.24.09.42.38
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 09:42:39 -0700 (PDT)
To: Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-devel@nongnu.org
References: <20190719133530.28688-1-mehta.aaru20@gmail.com>
 <20190719133530.28688-12-mehta.aaru20@gmail.com>
From: Julia Suvorova <jusual@redhat.com>
Message-ID: <f74c5290-a913-95c7-8a37-eb68abc9eb8c@redhat.com>
Date: Wed, 24 Jul 2019 18:42:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719133530.28688-12-mehta.aaru20@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
X-Mailman-Approved-At: Wed, 24 Jul 2019 13:13:36 -0400
Subject: Re: [Qemu-devel] [PATCH v6 11/14] qemu-io: adds option to use aio
 engine
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Sergio Lopez <slp@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 saket.sinha89@gmail.com, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefan@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/19 3:35 PM, Aarushi Mehta wrote:
> @@ -489,7 +493,7 @@ static QemuOptsList file_opts = {
>   int main(int argc, char **argv)
>   {
>       int readonly = 0;
> -    const char *sopt = "hVc:d:f:rsnCmkt:T:U";
> +    const char *sopt = "hVc:d:f:rsnCmit:T:U";

Add ':' after 'i' to pass an argument after -i option, as it currently
works with a long variant.

Best regards, Julia Suvorova.

