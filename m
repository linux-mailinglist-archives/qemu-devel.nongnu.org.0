Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B4E31131D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 22:09:24 +0100 (CET)
Received: from localhost ([::1]:44306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l88Ly-00061K-VV
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 16:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l88L9-0005bP-B4
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 16:08:31 -0500
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:40373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l88L7-0002ss-JH
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 16:08:31 -0500
Received: by mail-qk1-x731.google.com with SMTP id u20so8360988qku.7
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 13:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=UV0aG48pI2HXiIJktOqoPNt4YyEFZGmUutlXfO/WCN8=;
 b=uoHmkq9nl9HQKMIW+IzowM8xjYFmRLGpV7UBeSThY6ZIoJdXYiFY/eqeHatXQcrI82
 jPF3eJ6l3X72NBEEVueOlM0KYRwOWUrnffQUwjMF1Fu/r6GEK5ko7hcxMPkRZC0anU2N
 HBdSXjeEZWLby68NLraP5nwbtcbkpXM8JRo9Av9MKXLYfZ8fFIEmUDVzQ9X6nQXM+Bzk
 NLMa/ifbpJNjzen0+bSkmH//qEXh12TTkr+CDrokUU6fNf28v25Mwgf0TPPhVENbQle4
 9FXNGUd1dkGOcXgiDUKFWosG9sOoo36D9O4w0mKz9pmht3VygdRsr1KBF/ZsbpnBAKXe
 Xx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=UV0aG48pI2HXiIJktOqoPNt4YyEFZGmUutlXfO/WCN8=;
 b=bYqq+leQ2baLScvSYaWITAs6ReCAokRCRGstO+VS+gFz2oKGrXt+WfLI2BpAAxH9Dw
 Ecm0YRF3wEzEm7BN3Z7zjyjlu21drUCTqKOFmGV95UCaubjqT9RLKirjBa0AUK9pkk/h
 J7v9Y/COanpEboxvIMZoY+Q5rXeuiXw6dI9euUWcL/6LqiEiPcn/jBvzO2WbvkCx5ssH
 rnMyD33FBlvwdYsZM0UGPNRAbJGtz5Qn8Y0CUvcHK0mItgqEVcMkK2b97JO7izEkQNzP
 UuBiW9tZIa1M7TbrOET6cmLziZh9dJrKvKwlYiRdmG2+YLjal+3BvESah5S+CMb425zF
 qcUQ==
X-Gm-Message-State: AOAM532ue/pX6RWNCEJg0HkIGRHW94EvU06sMH2Hb3dIo99OlNgcllcr
 4hMcGbbn473y2b1Y+x6aUt0=
X-Google-Smtp-Source: ABdhPJzYOoqjJFIlhGryLVSo4N9ZyUSJTs8cnp13mHjrVkEpH/AOOcXq1UMpN93jcES0UVUfFpMnwA==
X-Received: by 2002:ae9:ebd7:: with SMTP id b206mr6363215qkg.280.1612559308206; 
 Fri, 05 Feb 2021 13:08:28 -0800 (PST)
Received: from [192.168.0.16] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id 2sm9013611qtt.24.2021.02.05.13.08.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Feb 2021 13:08:27 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Help with Windows XP in qemu-system-i386
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <20210205154819-mutt-send-email-mst@kernel.org>
Date: Fri, 5 Feb 2021 16:08:26 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <80B1ABAB-B593-4B79-8DA4-03F64371A84E@gmail.com>
References: <BD39B53C-E0C0-4D80-B80C-08E0F2CA6500@gmail.com>
 <20210205154819-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 5, 2021, at 3:49 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
>=20
> On Fri, Feb 05, 2021 at 03:25:00PM -0500, Programmingkid wrote:
>> Hi, I'm noticing that my Windows XP Service Pack 3 VM is causing =
qemu-system-i386 to experience 100% host cpu usage even when the guest =
is at idle. I was wondering if you are seeing this issue as well on any =
version of Windows guest? Windows 2000 doesn't seem to have this problem =
so I'm wondering if this is a bug with QEMU or a problem with my VM. Any =
help would be appreciated.
>>=20
>> Thank you.
>=20
> Just tried an xp guest, stays below 10% for me. Suggest discussing =
this
> on the mailing list.

Thank you for the reply. Which service pack is your Windows XP VM using?


