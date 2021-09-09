Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA8640480F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:51:49 +0200 (CEST)
Received: from localhost ([::1]:35318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGih-0005CT-M8
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOGh5-0004C8-N5
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:50:08 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOGh4-00075q-3b
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:50:07 -0400
Received: by mail-wr1-x435.google.com with SMTP id g16so1652424wrb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 02:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=shJ/1jxO26HVsIf340HhR4gKXt2SNs3yqIMKUM84vOo=;
 b=ltgk56FQmo9DY0kU2kQnNEyWHhi+wG1KX9erL/2S4DJl70vxc0Z5fe7TuiBKOakVsV
 flvdBnlW0ww2Izu2chE8t9EGzO2VDWmBN/dPPVPserApHoQGLIztN8yYKiGsz8IYZnuE
 qDpdunNXwLUuDpAWbNRXi86hs0WFp1tnmFUilOMERTya33xrap6Ws+q3koR+5uI3W3jK
 1tLHcSsg2nbDB42svMvCP3ufEpx2jjG5dEn8jcHXnpZGsy5u04o6ysqNwT00Sv6kUQPb
 fYH5YDjIpSz/4smTiyHSw2E5DQFITu0kxC8tR4rvaRZwwzfFCIy2OJyBZrDlrAN7c3vw
 y9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=shJ/1jxO26HVsIf340HhR4gKXt2SNs3yqIMKUM84vOo=;
 b=EiWKdg0sD5/Lew85bd65AAeqoqBHZ1r+mtnQAzqXmCkMI7+7ARPYfVwJj6aqI4dxC/
 TPOuFGjlx2dSRQc52oDpLmOAVVQXbUlPBdYi3gtlEwrfxfREGcdsP+k4Joqg1sBwuvlI
 feJmShaXM4Iol7ilyR6wDGVUHofVGjQZ2VFfjevXKYIkV+xccnK06dYKByUu52bwvjD4
 bvtvA7Bo8dGzzsVRKZjNmK7t1xxrECm8n+cxjkqOxh9wJ30mM0MnLiYQLY/M8Ico0q0K
 egQcQLAPI0r81Qbrkn9cmOzZezpSpsddL2xJt7f+A1ANEGcjETS9mvwGGWXDhO1TfYIQ
 4JyA==
X-Gm-Message-State: AOAM531V73+pQKUbs1TolRuzNl4XX0ejtC6bp9WccDO9SJBkgp6A3Ov0
 pyFLuPO+w4V4ypeKF7F5prEwbxUNygbCe2XGBbGC+Q==
X-Google-Smtp-Source: ABdhPJzRtq/umZm6qs6C6H/gETc0YfyZNB6PcpV7MXbJVNE+jln2qaRBtEWkVj/7IB8nMd1vadE6fY6UH26HBprTH4I=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr2367349wrr.376.1631181004293; 
 Thu, 09 Sep 2021 02:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210907104512.129103-1-pbonzini@redhat.com>
 <8b500aeb-b4e2-dcee-24f8-825ae6327acf@redhat.com>
 <e6790a9c-f2a3-75f8-623f-51726f4b656d@redhat.com>
 <CACGkMEuSNRmKX2ukdDkmhS91-o4Z0mi_TdASCm6aKNkFHum0gQ@mail.gmail.com>
In-Reply-To: <CACGkMEuSNRmKX2ukdDkmhS91-o4Z0mi_TdASCm6aKNkFHum0gQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Sep 2021 10:49:14 +0100
Message-ID: <CAFEAcA940jNBwBV1BwxmC9h-YMSQijNTtsfGYAsuHdAY0ruADw@mail.gmail.com>
Subject: Re: [PATCH] ebpf: only include in system emulators
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andrew Melnychenko <andrew@daynix.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Sept 2021 at 04:14, Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Sep 8, 2021 at 1:46 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 08/09/21 05:08, Jason Wang wrote:
> > >
> > > =E5=9C=A8 2021/9/7 =E4=B8=8B=E5=8D=886:45, Paolo Bonzini =E5=86=99=E9=
=81=93:
> > >> eBPF files are being included in system emulators, which is useless
> > >
> > >
> > > I think it should work since it's an independent feature. The current
> > > use case is to offload the RSS from Qemu to kernel TAP.
> >
> > Sorry, I meant "user emulators".  That should make more sense, they
> > don't have TAP at all.

> I see so I've queued this.

Did you fix the mistake in the commit message ?

thanks
-- PMM

