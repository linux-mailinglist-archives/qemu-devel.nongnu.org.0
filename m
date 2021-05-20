Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F236338B812
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 22:06:43 +0200 (CEST)
Received: from localhost ([::1]:44926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljowN-0005Al-37
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 16:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljoum-0003gC-Ho
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:05:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljoui-0008BM-TX
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621541099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4qrq+Dj7I2n3xSqoRb4I6OGi/ZWFbQjVw8RvFCfCLlw=;
 b=SjeZn7wXAUExi5yonjmYVchGZS27dWK+Chlu4DeAmcTRf3WGv3pdywRxyK5qSAsWnBc2Kc
 rXrNLxKRsck6b0ncMIWISXC8Sp6gRRPd+iSZSArp97HitKk4/rUvSrxetCqHqxhiNAdzgH
 oHfOxK72ajyr+tZxjRaUiHGV5iWG8qg=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-HSrH15mWODqgysm_rBNodQ-1; Thu, 20 May 2021 16:04:57 -0400
X-MC-Unique: HSrH15mWODqgysm_rBNodQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 b8-20020ab026c80000b029020f97f38cfcso5561998uap.3
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 13:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4qrq+Dj7I2n3xSqoRb4I6OGi/ZWFbQjVw8RvFCfCLlw=;
 b=U/kEshoU6EMJyMdpvhapspdOTXSLMi8MqDf2GWTtvouq85CD1e3jddR/SuWBPOxQzG
 nQGlisSMwIoxpVX8tggAlOcBJNgGpFDyfzf4rR0ZJAjOXzulLifETg13E35LcmTicA8I
 d868sPrlcCSZnfHWA4l3fymXxv/BII1zeZFoIeQGd2lm+Sfc8Sfx+blONMroCLN04IK9
 A/L4tLUgcF5loMZogbYxKBppxfVrEMXlMJ2o0Xw55LWnhSqNtOIJP/QDiHK9xMBk+5mI
 xBp8d7OWQMVwA1MuM/9IWAv45G4+YfvLSUQHv7OlAprbbJn8/OgNXHEazRjy9uS0tLv1
 gEqw==
X-Gm-Message-State: AOAM533eM0ndv1BpbCVbwi06fL0yhzlO9Cv6I+6nzUmxbdDoU5ELUnTu
 LOPKn9Iht8/Opo6BN2P4lIcFZr1E+TNmAlv7lS+snwNdmut0d0HMHhhPMryHPJq48O15H0+Octu
 rPJh0fcFPIBvxopmGnY7g8Hacte1G3NE=
X-Received: by 2002:a67:2642:: with SMTP id m63mr6111515vsm.39.1621541096656; 
 Thu, 20 May 2021 13:04:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJVKOYsy2t36djYq445Qr+Lmw2/bgNxoiB6iFGTJbOjJglMeAZInxotXy9C653qOKzNkfltXyJiMXL/NlPCnw=
X-Received: by 2002:a67:2642:: with SMTP id m63mr6111486vsm.39.1621541096430; 
 Thu, 20 May 2021 13:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210519185504.2198573-1-f4bug@amsat.org>
 <20210519185504.2198573-3-f4bug@amsat.org>
 <CAKJDGDbNZuicFLqKbHL7z7DqXnMbphQqcHh=YC72h6Lad8oxgQ@mail.gmail.com>
 <01a9372b-6246-2a75-5fec-8b3cb299d78a@amsat.org>
In-Reply-To: <01a9372b-6246-2a75-5fec-8b3cb299d78a@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 20 May 2021 17:04:30 -0300
Message-ID: <CAKJDGDanmPNksV=-rCO0FfJD88BwNCCC2_ngHFihFG5a2T-XTA@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] gitlab-ci: Rename acceptance_test_job ->
 integration_test_job
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 4:38 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 5/19/21 9:26 PM, Willian Rampazzo wrote:
> > On Wed, May 19, 2021 at 3:55 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>
> >> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >>
> >> The acceptance tests aren't accepting anything,
> >> rename them as integration tests.
> >
> > Kind of related, I'm missing a patch changing the name of the
> > directory from `acceptance` to `integration`, but we can do it later,
> > when this series is merged.
>
> This series is focused on GitLab.
>
> Do you mind sending the patch? :)
>

Not what you were expecting, but at least it is a starting point for
discussions: https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg06553=
.html


