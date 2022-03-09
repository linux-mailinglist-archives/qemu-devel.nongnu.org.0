Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E704D2E42
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:41:10 +0100 (CET)
Received: from localhost ([::1]:39408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRugn-0001vM-4x
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:41:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRueC-0007W8-8Q
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:38:28 -0500
Received: from [2607:f8b0:4864:20::b36] (port=35782
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRueA-00028n-L8
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:38:27 -0500
Received: by mail-yb1-xb36.google.com with SMTP id z30so3751405ybi.2
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 03:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CCCw1H1qMCOeoLbq8axFLkwUXfKumrSxEH3N1WBDPrk=;
 b=QeXAScoKHyyb+in/o3k7CFSnebi6VOQ2UNg90rsTacVEwLRn0Nv5pT4+I70Pn58If3
 bZMwyzBPFL6gBXugD8ssRG6/1Cdf/RolCMnaJbaLlt16vYvcak5ndUhwpMMY8zMcBZlx
 d7BU1olgg2ojoDdwVkhDPVZ47hoiaEC0VJb4J53tIiPQdkH0xHMcl0NCqP5jsMVhDeox
 TDGZQxaOMbWTsqjKWcC5K8dGwCWnNqMHnrYmYk846ALDJDdScerv0bPHsKfAWncpNEoP
 CaEFYzQMLpLzn7EaWO0mDmLF83G2E1oafPqF8bsadtUt8hDRnXor3153oT0cGW8ohIOF
 s3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CCCw1H1qMCOeoLbq8axFLkwUXfKumrSxEH3N1WBDPrk=;
 b=cv2f9H5rLBs59ceejbsEe8PKvkjyazgXrwyQ6bc8MK/Rb/SqKAjTXciCh5WKv2+CxX
 e9hLO7xEp19GsEKnYs6QUC6e8p45ojk0UesvjyaJZyAjdtJkVNst0Hz7nrtnG58OZBax
 N58cnGGYdvt5WKE/eQTnaTdTeLtiaqnrS4mWTCE/uCvvd92kwoq8HPD8lfQxlcKAFG79
 DdBSsjx8c4e+KNjWzSnNvSUO99lGzOnlVRilTI4PxfSMB48y7gK3Qeiv4V4yiNVD6aQ+
 6FoPQd1zEap9TfflcHgwv8zyNDKMtFKuZquUqIJtje8GipmCbCOLdcoJFMU0ih0be+hW
 +esA==
X-Gm-Message-State: AOAM531qp/fwBmjVObv5SKj7ujYY3KpUewsIGliUa+meEAAGuF4324I2
 s7YXTpShAKCZ+f3wRB5a+oIn+OYPsrpa79s3vfKkDg==
X-Google-Smtp-Source: ABdhPJzVHx9f4a2yICNfoMdBnMDuEJJcYCUkrfnsthVlZudMNL94dalbSOLoRfsdezKCRRAyApChaw0crF+1YF+AfZw=
X-Received: by 2002:a25:d181:0:b0:629:1919:d8e5 with SMTP id
 i123-20020a25d181000000b006291919d8e5mr14517486ybg.85.1646825905483; Wed, 09
 Mar 2022 03:38:25 -0800 (PST)
MIME-Version: 1.0
References: <20220307234557.9081-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307234557.9081-1-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Mar 2022 11:38:14 +0000
Message-ID: <CAFEAcA8y8VOTj1paYgCKAK828_2jgqfNNusS0Tc4r0AboRSeZA@mail.gmail.com>
Subject: Re: [PULL v2 00/16] MIPS patches for 2022-03-07
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 23:47, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The following changes since commit b49872aa8fc0f3f5a3036cc37aa2cb5c92866f=
33:
>
>   Merge remote-tracking branch 'remotes/hreitz-gitlab/tags/pull-block-202=
2-03-07' into staging (2022-03-07 17:14:09 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-20220308
>
> for you to fetch changes up to c35fef9a9c7fd5397bc624d5bba05cef514b5737:
>
>   tests/avocado/linux_ssh_mips_malta.py: add missing accel (tcg) tag (202=
2-03-07 20:38:41 +0100)
>
> Since v1:
> - Corrected last patch (screwed during git-am conflict)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Fix CP0 cycle counter timing
> - Fix VMState of gt64120 IRQs
> - Long due PIIX4 QOM cleanups
> - ISA IRQ QOM'ification / cleanups
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

