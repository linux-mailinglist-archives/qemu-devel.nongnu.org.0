Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53C24BD10C
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 20:36:35 +0100 (CET)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLs0Y-0008HY-H6
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 14:36:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLrt5-0003Mv-SN
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:28:53 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=41916
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLrt3-0006Qv-8y
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:28:51 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id j12so30062153ybh.8
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 11:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tctimsWrYk2WlN3aLS/CQgFzQlQH0e7K+qSQWlGupbQ=;
 b=x0vz1mYU45EgU7bHgoivgYnhp1q/7ZB1RA+aUIgyJwv8LFiQutZxIaaCgMLVLeoXf4
 XH9dgyLqprfSFd8udHB34PoYtTnQ0ly5aaZxpMCK9wPQTZh+1CTLrVeBx39UvO3tZTca
 MTiePHlebGWbzljL8UWCumIaMx/87r82mqajJK7xCTvmg4oj5Kb6pMYtJiFejR36U47s
 4Fw6NREl4NdKvzbzhWCku7J0mna+8kYof4WyWUxYlXy1fflx9mOjp7Z4VoCZkBXrJvGD
 UdolRlteGesPtRYDSROrdJxrJWLRNGPvRzBFQfn6AF0EPXeRHeJufvMRf3py4OvAhbrF
 xJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tctimsWrYk2WlN3aLS/CQgFzQlQH0e7K+qSQWlGupbQ=;
 b=ayANhp9BHCSYnD6HJqzttcoe9o6VrZ/a8PY4hH8/0hjO+W3xoz4DW7GS1I2UChG69G
 RMZvsIW1r5LYvrGFv+lek6mEpZn9sn7KzkxSkLaCAyK2tyzujgSlGQoWb7QO1tUnEpU2
 +lKwLAaDyf/Ceyso4ZjiBU3mzzC7oIe9rmATDmgwaNjcGRA/+qZYTzlQtVLtEgk1FE3+
 C0BwCMd3Yn+LSKyRADQvU5agQZoU10nKDV03+Lqa22Ytedyh+ASRNqn8ntVkfKRcY40N
 1nbZjWXOh6YERyK6qEbM8598gb9gq/uepH17eZ9ayZnNtYr/TM+8fEmBM+PYdfkvCgqV
 ZETQ==
X-Gm-Message-State: AOAM532N/h6/hJWI6j7ZnExZutIoalbaFyggOtU7tOhDRVRuf2HJS6IF
 8itfeyjZf6/LvbADDygD0rjXJYLhKFn+F2srwDCNwg==
X-Google-Smtp-Source: ABdhPJzyT/K09od7dZmVlfkdKMgpR2W0quWe3iTkn6or8YlrG2mIo5ToK+8XiyX2lfRpRIIjxgNtXe2+f4uMb315TQo=
X-Received: by 2002:a25:5011:0:b0:61d:853e:ef96 with SMTP id
 e17-20020a255011000000b0061d853eef96mr15891966ybb.288.1645385328167; Sun, 20
 Feb 2022 11:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20220218103827.682032-1-clg@kaod.org>
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Feb 2022 19:28:37 +0000
Message-ID: <CAFEAcA9L54EqeGGW0r0M7JqV=4o+bQPmDpFPdZdmb=SfDFOUyA@mail.gmail.com>
Subject: Re: [PULL 00/39] ppc queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Feb 2022 at 10:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit c13b8e9973635f34f3ce4356af27a311c99372=
9c:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply=
-20220216' into staging (2022-02-16 09:57:11 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-ppc-20220218
>
> for you to fetch changes up to 65e0446c86ee70d2125c1f1d1e36e6c2dfb08642:
>
>   target/ppc: Move common SPR functions out of cpu_init (2022-02-18 08:34=
:15 +0100)
>
> ----------------------------------------------------------------
> ppc-7.0 queue
>
> * target/ppc: SPR registration cleanups (Fabiano)
> * ppc: nested KVM HV for spapr virtual hypervisor (Nicholas)
> * spapr: nvdimm: Introduce spapr-nvdimm device (Shivaprasad)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

