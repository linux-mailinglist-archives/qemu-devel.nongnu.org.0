Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2783EEBC8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 13:33:43 +0200 (CEST)
Received: from localhost ([::1]:58148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFxLi-0001sC-HR
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 07:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mFxKS-0000op-Cq
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:32:24 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:38359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mFxKR-00032I-00
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=vo2eulmQDHiU7yYFyDmIOimdj+AgEmT76kFjokAcy3g=; b=VqGh9AX8oQho8fZwa+MsnLggdr
 7cHCZnSZvgHB+qyaIIJrtKkrwhGFqs7hZQel1PnToLBpFBwGNxmRs3KDreJOdeFIITB7DbN+WtxC2
 g4oPPfOlHz8GIBjhUXpXIU2irNjT+NnniWpp0RyhqWtTQhRzkatoM4xVoHVUXQnfgjb+fUvtPwgqG
 dLbM4hwMc5Ub6/xR70Znc0nika7jriV0cCZKk+7z+eexNZFBSW6AlkGhiMKnqmcCgOrN2cGW1O6SL
 kaf0F86Frubo5OpXT9pqR3uSeqKAkmAFdpo84H11CAl63eLqCzSmVMcKuWoSsck1MlQtcookojsLg
 H0xAfM/dOXZi/1IYEjRCla8Twm3emjXrc/PJYKwt8KvikyEzW05LtqcG42+naWBzJPJLxGYaKoNYR
 4eDfCHfQbvRRVfBVAah0Gs+5u3FuAxKtdupth8ezjfdPaMFflRyzxGKz2Ego0Lzb3PHlfc3meFtwU
 ZOP/Jvn+UzK3R5e0OrXu83sBlVEFH1G4froCTWNLJzCU9RzzYl9ziSdKcMXejAcP8Z1r72z11SJYx
 qOb5H/Ak9F+sqIlmIGFljaiaigxrkJfKrLEzlXl1Vq7q+o8RfxDCGLSK3yPAksWOCygIXqrLpvIHO
 6HUBKWYQy+vci+ajyy6bUbZxjXeGhI/1MArFSG64w=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?utf-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?= <dirty.ice.hu@gmail.com>,
 Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 Yonggang Luo <luoyonggang@gmail.com>, clamky@hotmail.com
Subject: Re: [PATCH 2/3] MAINTAINERS: Remove SPICE from Audio backends section
Date: Tue, 17 Aug 2021 13:32:20 +0200
Message-ID: <2708059.HZLvSqFPaX@silver>
In-Reply-To: <20210816191014.2020783-3-philmd@redhat.com>
References: <20210816191014.2020783-1-philmd@redhat.com>
 <20210816191014.2020783-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 16. August 2021 21:10:13 CEST Philippe Mathieu-Daud=E9 wrote:
> SPICE audio is already covered in the SPICE section,
> so remove it from the Audio backends one.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9ec6baa7e4c..f18fcd76450 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2270,6 +2270,7 @@ Overall Audio backends
>  M: Gerd Hoffmann <kraxel@redhat.com>
>  S: Odd Fixes
>  F: audio/
> +X: audio/spiceaudio.c
>  F: qapi/audio.json
>=20
>  Block layer core

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck



