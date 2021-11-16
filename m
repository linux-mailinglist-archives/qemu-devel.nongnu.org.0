Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84634453210
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:22:49 +0100 (CET)
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxU8-0002ED-En
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:22:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mmxS2-00015h-Rd
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:20:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mmxS0-0008FT-1V
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:20:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637065233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVrKeaaVU2N3G4/JoQTR/yNqtrSqi6c9JmYNHMNF/cU=;
 b=bE5PGNvwQLZTxX8I9/zXMU14JeCPcFBFBKA55Av23QKYqN16YuU685zMhvKzJGudSPdPGo
 xHmoEFfsKDqLmR5n7k1VG4X+ANb3rd4A3nVUqcRKn1QDd1iiI2xpO+XLgxEC5Opy6OMtp4
 ORJ4EKX6bNjU0H8by5WNAjJcB+aSBVo=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-pJJ9NO8_ND2ax4jLpdwRHA-1; Tue, 16 Nov 2021 07:20:32 -0500
X-MC-Unique: pJJ9NO8_ND2ax4jLpdwRHA-1
Received: by mail-pg1-f198.google.com with SMTP id
 p13-20020a63c14d000000b002da483902b1so10577564pgi.12
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oVrKeaaVU2N3G4/JoQTR/yNqtrSqi6c9JmYNHMNF/cU=;
 b=8LIFTJtvSyDRgOQN6P2lYuZ5nRDRJdf17v6Z5V/EzzPkZQUdioOnLrflbFjND4KbxA
 O3d8XJqhwTf2BlUA6xuU6Vp+4wHWPutMRoKtTCl2NNMurd8iHaqSvobUsOjRBy4obp/y
 GAHIk0R2Ttjv8vO6H4naoEuuer1rQAs5aitA5TYtk5VBY41K/I5LE7WA++WeRsb0vnAH
 vlbsphEiQ6/9A+aCJJV65KQ2nQCvu+WwP3nfL0LlSYd1QBYa3yZjLdpmKy4/3PVmfolW
 c1VgucNoYggdPT6ZVFkrvZy+UDfth01AyNQIF/+ADbvYdPPt988bKRFnpSZ1NYlRbGjF
 H9Bg==
X-Gm-Message-State: AOAM530Z0+NIxFjbkc0PQ73yT/+5hV3Ovjsh7Wr75NkBrh5bC1inbXRo
 bgEGk5orn3kJW3ZyS8SapJp+auuGDa0Hi4rBpaIsbrTupjYvTw9rRV7YPbvgGDt1KUMbqFTc3FY
 JvXokn5RQR91CqapXxEuUKECHBOMCLfk=
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr75607719pju.123.1637065231394; 
 Tue, 16 Nov 2021 04:20:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFY2ICpjN+mrlmFYiTHNAPC0vdOEV5GkDSXSmG0+o/cPZiYDddkv0rRo3aUrZsVMjLRDc09cIV5SPZHImwqK0=
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr75607694pju.123.1637065231153; 
 Tue, 16 Nov 2021 04:20:31 -0800 (PST)
MIME-Version: 1.0
References: <20211116112757.1909176-1-berrange@redhat.com>
In-Reply-To: <20211116112757.1909176-1-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 16 Nov 2021 09:20:04 -0300
Message-ID: <CAKJDGDaPS_Z_suyj-dR1nTadCP=jdv9UdK7Ptd7VFUaAP0tYhw@mail.gmail.com>
Subject: Re: [PATCH] gitlab: skip cirrus jobs on master and stable branches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 8:28 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On the primary QEMU repository we want the CI jobs to run on the staging
> branch as a gating CI test.
>
> Cirrus CI has very limited job concurrency, so if there are too many
> jobs triggered they'll queue up and hit the GitLab CI job timeout before
> they complete on Cirrus.
>
> If we let Cirrus jobs run again on the master branch immediately after
> merging from staging, that just increases the chances jobs will get
> queued and subsequently timeout.
>
> The same applies for merges to the stable branches.
>
> User forks meanwhile should be allowed to run Cirrus CI jobs freely.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.d/cirrus.yml | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


