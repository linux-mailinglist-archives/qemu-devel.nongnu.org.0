Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B13E2B76B3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 08:14:57 +0100 (CET)
Received: from localhost ([::1]:45510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfHg8-00035l-6t
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 02:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kfHe2-0002Vr-UF
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 02:12:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kfHdx-0003V1-S8
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 02:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605683558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Aulvoca4iWzqcOrALbFMLMDBLQ4A1qhKXeHaJt9Ls4=;
 b=fZLFJF4iVZvJ5iiefMHqsdZTCY0pBnS6x3mkF+w+whQ68iEz1T0Ql01oVeFc14gMFAiVmr
 mTlGs4de4AYtoeBLWKZjQWmo/yTEoPI9UYuiiWibq42IqH23jyj81VlLuiqSRjevqw16Ob
 fx2UKjP/vFp+V2OxfdDFKwJwUqX+Jx0=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-PWhY0AVnP3mPVGjtfZvxTA-1; Wed, 18 Nov 2020 02:12:36 -0500
X-MC-Unique: PWhY0AVnP3mPVGjtfZvxTA-1
Received: by mail-il1-f199.google.com with SMTP id f66so840617ilh.17
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 23:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2Aulvoca4iWzqcOrALbFMLMDBLQ4A1qhKXeHaJt9Ls4=;
 b=Q0DiOXMozeyIs2v9RlJf3slCuJh524ye96gm/lNHes9vURzuXuZ7f7730gAdIOYKyT
 NBaQY3OV6hYoPb8WC5Br+8w2TVIYXhvIYOWaggbauAKeWFmEuF9ANH4GxoJVzDyUXJjk
 es/tBTUQvu1RrTz97DXBHGPAE7N273yiGqiAk1MJiJcp1bk19nqG2yAzMwDUCBWZtFoF
 PcTUoz8t9w+rWNFPgx3njpsXOCzJafdM+lTjpurtCnaAkWF9HDdWFjktsEIHVhoFJoTB
 cokflKzBTUa5/tHLX1hRDgJ+PGC9r3oquo1WJp/XXQocOGjHZkLEBYziU4igD9ftD2Xu
 S/eA==
X-Gm-Message-State: AOAM533rT1qqzITHWGDSqF8DJ2x2UsN9yzgF2owKJ1aTR6aWHsGtHqkT
 NgmUjN5c7G5CJ4PADTbBOQIKifHMstv8iPSX8Z+aG69kvy++8lVnKuMso4wh/E4q74lWo+T1KcS
 unlNqAfnckL5m05411wIAEZulW/bugms=
X-Received: by 2002:a92:cb8d:: with SMTP id z13mr14739662ilo.182.1605683555711; 
 Tue, 17 Nov 2020 23:12:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzENso0GMO+dwuIhu0NTfhwntwfErUuj6TlCeFx5QdCQ6KQJJ3FGSEEmNa/F/4w+eyRiXgApZotUbqpCfydUrw=
X-Received: by 2002:a92:cb8d:: with SMTP id z13mr14739653ilo.182.1605683555465; 
 Tue, 17 Nov 2020 23:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20201117190640.390359-1-sw@weilnetz.de>
In-Reply-To: <20201117190640.390359-1-sw@weilnetz.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 18 Nov 2020 11:12:24 +0400
Message-ID: <CAMxuvaxxJv521FzuDW+TgX-tdykr7HpA+Jexrs4w7_dqqNKVqQ@mail.gmail.com>
Subject: Re: [PATCH for-5.2] meson: Fix argument for makensis (build
 regression)
To: Stefan Weil <sw@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 17, 2020 at 11:15 PM Stefan Weil <sw@weilnetz.de> wrote:
>
> `make installer` with a DLL directory was broken.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  scripts/nsis.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/nsis.py b/scripts/nsis.py
> index e1c409344e..5135a05831 100644
> --- a/scripts/nsis.py
> +++ b/scripts/nsis.py
> @@ -65,7 +65,7 @@ def main():
>              dlldir =3D "w64"
>              makensis +=3D ["-DW64"]
>          if os.path.exists(os.path.join(args.srcdir, "dll")):
> -            makensis +=3D "-DDLLDIR=3D{0}/dll/{1}".format(args.srcdir, d=
lldir)
> +            makensis +=3D ["-DDLLDIR=3D{0}/dll/{1}".format(args.srcdir, =
dlldir)]
>
>          makensis +=3D ["-DOUTFILE=3D" + args.outfile] + args.nsisargs
>          subprocess.run(makensis)
> --
> 2.29.2
>


