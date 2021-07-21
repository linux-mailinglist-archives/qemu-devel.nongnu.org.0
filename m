Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE193D0999
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 09:23:47 +0200 (CEST)
Received: from localhost ([::1]:55850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m66a1-0001i5-PN
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 03:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m66Yq-00011X-IZ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 03:22:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m66Yn-00053U-Ob
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 03:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626852148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVFPmq6HK/jJWOuT5gOrF07Xp+7+mw7fp/SQbiXDAQM=;
 b=Ldexs6cngTgHUNDk15YU6aozTlZ8YptThwNPhdcUtwxJN1/7VaNSEKE8gWbv6ZN0wuFZvW
 vB27CqgD+kutnBVx+lmVwzKkYa1C2+bullYifdLT5Urvh3L5XkcPUtFQ4oEe/2xBl4jQTm
 xRiSHH9QDWQwRQle8Gllj+jM7Iz8F4Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-cX6IuqcSNMeBT0pDlcgoFw-1; Wed, 21 Jul 2021 03:22:27 -0400
X-MC-Unique: cX6IuqcSNMeBT0pDlcgoFw-1
Received: by mail-wr1-f69.google.com with SMTP id
 a4-20020a0560001884b02901401e436a18so561657wri.21
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 00:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RVFPmq6HK/jJWOuT5gOrF07Xp+7+mw7fp/SQbiXDAQM=;
 b=Ewx6WoeO8i5mzFobxMUeU8puRxVoziqizCfso7fmiMIe8kl1fccn3EbJ4a1mOP0BY8
 7fjCN5qtudyAgU0EHDNCG7+3QjFF9qQgqu/Pn4pqggWXtrPormxUPiR1p923KXtVhgW4
 VEEfF/0twwDO8AdPY42IZenhuAFQL8ubRsCE/3JFbxNn9hZdWMujtBOjLTxlB9yHji8a
 pvZabaoZncU1kcf3ffJYMK0Q8dUhE2jWiy+YziBd/4ASBv1oPIweFJhFBvEAN68w6iyg
 mjKgvKz5QKTrRTd8GWts6qQIjaVbFF3w2J6GedMYVdnYQQBRj3jkBRoEcWl1qb7nZUoi
 hEjQ==
X-Gm-Message-State: AOAM5318MjdZk5jRpeAlNdB+T7og6A2aOkV+//UIdtFqoLvF0+tH6pH5
 hm2u2Um893/YxnBahkfC9LX5+4PKwyXuB1sGRGFzWz8Zt8ZCmdVaWXPjkkSPFcXGHOFsdpaTQuh
 PFCzmosD+fky8k9E=
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr40309279wrs.7.1626852145773;
 Wed, 21 Jul 2021 00:22:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYfc2RtEMzyomN1royoenyN++I5lsamEQRbQ46vs/Fo0lXhPD0u27UeqIS5tVkaQcvnVv0eg==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr40309253wrs.7.1626852145553;
 Wed, 21 Jul 2021 00:22:25 -0700 (PDT)
Received: from thuth.remote.csb (p5791d597.dip0.t-ipconnect.de.
 [87.145.213.151])
 by smtp.gmail.com with ESMTPSA id f7sm25839124wru.11.2021.07.21.00.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 00:22:25 -0700 (PDT)
Subject: Re: Disabling TLS address caching to help QEMU on GNU/Linux
To: Florian Weimer <fweimer@redhat.com>, gcc@gcc.gnu.org,
 libc-alpha@sourceware.org, qemu-devel@nongnu.org
References: <87im15qbp3.fsf@oldenburg.str.redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c9ce99db-874b-03c2-9561-be9b59bd1988@redhat.com>
Date: Wed, 21 Jul 2021 09:22:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <87im15qbp3.fsf@oldenburg.str.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Iain Sandoe <idsandoe@googlemail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/07/2021 16.52, Florian Weimer wrote:
> Currently, the GNU/Linux ABI does not really specify whether the thread
> pointer (the address of the TCB) may change at a function boundary.
[...]
> One important piece of software for GNU is QEMU (not just for GNU/Linux,
> Hurd development also benefits from virtualization).  QEMU uses stackful
> coroutines extensively.  There are some hard-to-change code areas where
> resumption happens across threads unfortunately.  These increasingly
> cause problems with more inlining, inter-procedural analysis, and a
> general push towards LTO (which is also needed for some security
> hardening features).

Thanks a lot for your mail, Florian!

As a context for those who read about this for the very first time: We're 
currently facing the problem that the coroutines in QEMU fail when compiling 
QEMU with -flto on a non-x86 architecture, see:

  https://bugzilla.redhat.com/show_bug.cgi?id=1952483#c6

> Should the GNU toolchain offer something to help out the QEMU
> developers?

I guess that would be extremely helpful...

  Thomas


