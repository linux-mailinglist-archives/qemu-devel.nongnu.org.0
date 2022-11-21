Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7218E6319C9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 07:40:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox0SJ-0003HB-CE; Mon, 21 Nov 2022 01:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ox0SH-0003H3-3I
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 01:38:57 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ox0SF-0006ur-BG
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 01:38:56 -0500
Received: by mail-lj1-x231.google.com with SMTP id t10so13491715ljj.0
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 22:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uLVdtfkNdBDXjEvBnXzbdKqS67r0Vp1D2Ll/WjR6Dzg=;
 b=ZWtPr2+Ga7Vd7oTMmKjYwURPv6QmcEbymx/pdl1lP0TLKLM4oyfdaxUgunvhFiRnOF
 4RztqLPVpqZAH9Qye7Xnzj8OsY7+ngf7Q3dwB/PSRAKOQ+JbaeuKFEObs+OozIM81rPx
 JUP/O6h+n+WonxYy2QRc4usCGq3q47qZv7lWTiKIPiph7Kzr25SvXOcGppG3U+PFBn11
 6AkdpoVj06SfWaQt2cGMNJbWZrfMKl7IlOqRuUwBebpgi4oMOqGzTeUwzqHthns1G6q9
 1BbjQNjnshGytMsy5ZNFqswAxosIPpiUsjkYyi/PeDfKuCmitNnom3t/RUNEPWe99WZi
 wV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uLVdtfkNdBDXjEvBnXzbdKqS67r0Vp1D2Ll/WjR6Dzg=;
 b=ilBpXHhSRDR33/Ds9+UAbQzc817Sq0S1ca1iSP1XkSPfX9KZZuh56H6WQa4/mN1KPo
 gyjI7bHqO7C23qSBrG7ej0JMv8pXy9idJD2l3OnFNOHHesfOTQydzt+mK2zq7Zb8eLrd
 VLlteJBIaeDC4u7PDoIkolW7TcIaCiYrOp07WySLC8uD/usldfbNladYa0Km5niwjQNn
 00Og1B+w025nmLdeXfX6xiPB86ufyYlxjO4CA6raJoY+YJZcibc0vfeYZocqiCzkWZ0p
 5kWiTaO4I+zqNcpZH2mbCp5Qdvt2O6a08GRhK0Tfe5PcalWVYDM5b2T1ZPSVdyRHP3HH
 XocQ==
X-Gm-Message-State: ANoB5pl2F8pS5Hf9cCVBC2gzKCSQob8gIYVgG9Gf1dYOtDkq/6b3/17e
 yAWw0urjJOw3EsB+srypbgLty7fCbcHR94920vQ=
X-Google-Smtp-Source: AA0mqf7K5skxfMTaPpsR0jj0lEoE0BEOudwJ2dYJNd8DveMoI60ykI1Z4Mp12eyKtBqKLtIDmF7xWuy/+5edaDqM+cE=
X-Received: by 2002:a05:651c:2328:b0:277:14cf:6da2 with SMTP id
 bi40-20020a05651c232800b0027714cf6da2mr4950068ljb.94.1669012732882; Sun, 20
 Nov 2022 22:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20221120140044.752503-1-kfir@daynix.com>
In-Reply-To: <20221120140044.752503-1-kfir@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 21 Nov 2022 10:38:41 +0400
Message-ID: <CAJ+F1CJzw9M_DEbe0QG7Z8pt91JnNfZ8v93Ni8o9Fxq2ZVr=wQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] qemu-ga-win: 'guest-get-fsinfo' command wont query
 storage devices of bus type USB
To: Kfir Manor <kfir@daynix.com>
Cc: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Yan Vugenfirer <yan@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Sun, Nov 20, 2022 at 6:09 PM Kfir Manor <kfir@daynix.com> wrote:
>
> guest-get-fsinfo won't query storage devices of bus-type USB (https://bug=
zilla.redhat.com/show_bug.cgi?id=3D2090333).
>
> Bug, get_pci_info function returns an error after not finding any storage=
 port device info on the USB disk parent device (because of USB abstraction=
).
>
> Fix, skip getting PCI info (get_pci_info function) for USB disks (as USB =
disk doesn't have PCI info), and return an empty PCI address instead to kee=
p with schema.
>
>
> Kfir Manor (2):
>   adding a empty PCI address creation function
>   skip getting pci info for USB disks
>
>  qga/commands-win32.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
>
> --
> 2.38.1
>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



--=20
Marc-Andr=C3=A9 Lureau

