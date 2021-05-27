Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3768393603
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 21:12:00 +0200 (CEST)
Received: from localhost ([::1]:49964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmLQF-0004ZW-Py
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 15:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lmLOO-0001uf-KX
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:10:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lmLOK-0000ND-L4
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:10:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622142599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rjZN8pniqe6xZHzUhBka7gA/qFloSG6AlN0oOGAyzKU=;
 b=bShKhU/vmusAP8Pd/P4IEgs+Dyc2vuMRbeHIBbGXj0jf+pdiyLm4Fj3jJpYX1ADZ67K1oC
 IrfLJlsV3fBqlC0fgBnC4djTdfjH4ZoZjXDHrGSVVHkI2zOGlMN/wKCax1bzAzMX/1bifJ
 DC+CIfXpIzcfqwHb3jBtzx2cL+XQOvY=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-vodfYm3LNlmndF35YqzYTA-1; Thu, 27 May 2021 15:09:55 -0400
X-MC-Unique: vodfYm3LNlmndF35YqzYTA-1
Received: by mail-vs1-f71.google.com with SMTP id
 n26-20020a67d61a0000b029023651d629a4so616307vsj.0
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 12:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rjZN8pniqe6xZHzUhBka7gA/qFloSG6AlN0oOGAyzKU=;
 b=AF3Pu73cjTWFCMHquo9apfRwEfjlGD1mYiBbVwhn4db9MmGz8VwG5NHCc16+xsOY48
 8hnoxt55aEOlnHW26J+lkpaftY2rtx0pl/G+XbbzU6gwZ3TtpMwJViJUjODJIOoDCOxT
 EYoUMoz9SAlMDforHjiQazLevS/SsFAPcikg2FUqGURJIr4Bpc+nD2dnCe5ngIdnRf6u
 enpKzc30nMfUK7GINpSdd/CqpgGalD3LxaeVV9osVoN+mGLEGdFHUNUTnCcmqxgEZ6ix
 rNC15sZl5BbnT/rxywwCG8fExMIJs9JEE446IN4rHZiMtfsPcrKZc68MwPe0lTk6CIEe
 Q1Jw==
X-Gm-Message-State: AOAM530dHiDSaJLA4oFA3+wccdp/aTkRDfTe/P/RPUM/lqBcKly84Bkp
 sp091PTz7nX6Xl1ums1OrYZF2bAet5vG8X84J+IaXKZn1I+HTiRJVFeZJV1R6jDxaTIYQ/fHxie
 OmcvjAJlSFldO9Ukq5HIBBZjv7YuqYlo=
X-Received: by 2002:a1f:308a:: with SMTP id w132mr4054861vkw.7.1622142593588; 
 Thu, 27 May 2021 12:09:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/PJDZvc5FAndsqf18+WBs4WRgjfDC719t9niLLHQC/Zia9/sOqKYMClfhLoKeH9rkKsVgUD8JLPWeYA5Ggzc=
X-Received: by 2002:a1f:308a:: with SMTP id w132mr4054678vkw.7.1622142591593; 
 Thu, 27 May 2021 12:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210527160319.19834-1-alex.bennee@linaro.org>
 <20210527160319.19834-7-alex.bennee@linaro.org>
In-Reply-To: <20210527160319.19834-7-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 27 May 2021 16:09:25 -0300
Message-ID: <CAKJDGDYCNxscVE89m7r7Qe2-CgqA-jbi6SK-AdbPRrb8ThxsRQ@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] tests/acceptance: tag various arm tests as TCG only
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Daniel Berrange <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 27, 2021 at 1:12 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> We should never be trying to run most of these models under a KVM
> environment.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/acceptance/boot_linux_console.py | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>

Tested-by: Willian Rampazzo <willianr@redhat.com>


