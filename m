Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4695A6C1E9A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 18:52:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peJfL-0004on-W2; Mon, 20 Mar 2023 13:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1peJfJ-0004nz-G4
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:51:25 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1peJfI-0001Pt-1C
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:51:25 -0400
Received: by mail-pf1-x42f.google.com with SMTP id z11so7445979pfh.4
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679334682;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PoR1HzKOaChNPD/INe1BrjAiLswjQvz9c1vkeDLzZVI=;
 b=YopzoZOs0qIT9jICAqGJczXRQVrT3dd0ddnO3AUZcYT6OvrZE6YFTbz9c7thXYl4Lc
 MNrYz5PfdYZmTZXzPCjNlosbeGmp/682YK6YSE73EVsJ9uioenEvJ+fgtSgdRgvmFpH4
 Yvw6HpL+XGAf/VwPL1q6Uk97w36ds42VCoTH+/llNT6hKrfv5jAZ6Dx/fZY8A5ZBqlkN
 yf02ymdn/F4lF6zwYMxn9ZmWN8V+uWsaWZ4nASXMjKodj80OtRQwY3s3vCD8dEJLqOAe
 N9JHGU8Xjh4rlQW/5iN/TpWvwGKEdCCANc3BY1ObSz9DQP+sFg0MlBn0h8w5e735zTu8
 YgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679334682;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PoR1HzKOaChNPD/INe1BrjAiLswjQvz9c1vkeDLzZVI=;
 b=wlP3rImRzDvLqnCJwjwm8aq/HjNuptvmk+CueRO909FGmzFaRrKjC0pXnoDSisLvvJ
 RbF6ULA9ouJsNF8RZVfndz9aiLpWowEXL14Nkr1dirj3acxLIhBxtqBY2fg6iF2aeT7O
 MfTxfBLbKMAMfkWlb18hobf31j/3Rz+vur1ixsRAMntsU6HQYgepnK+ROjEpb0UnQHcs
 H7PK9Kt5o8Woi6pdybJ07+F9x6SLPIWKfHaA+W4blxHenGi1Uhvg3D7EtDLnXdi5r6+T
 SWKzQEqeiBhP0Pb4K4FsM5fFY/dTiyWvny4vnAv0gYuDJouJKWIOkcAqdfUcgX5kb4Za
 HT+w==
X-Gm-Message-State: AO0yUKU09Q1cDuGR4sEUBgQaZeDy1/G1LkGcw7uNajBSjPzkucJbGOu8
 v2epL7v1mtsp7//VTNxPYtdAiWolOF75J/4gvcWT5Q==
X-Google-Smtp-Source: AK7set9GVNZW1JYOIRXGt3n9rsYH0f6n3NHn9i3icv4Jni+oYxYXQqJlzMUOIIiH8BDkzmY6qrB/e8aMbXZBy/3ByQk=
X-Received: by 2002:a05:6a00:a95:b0:625:659e:65c with SMTP id
 b21-20020a056a000a9500b00625659e065cmr7012961pfl.1.1679334682436; Mon, 20 Mar
 2023 10:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230320093847.539751-1-kraxel@redhat.com>
In-Reply-To: <20230320093847.539751-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Mar 2023 17:51:11 +0000
Message-ID: <CAFEAcA9vP3+zL6DCmSPtpymeBVdsNB8Jw1RiVpy42kdTsd85=A@mail.gmail.com>
Subject: Re: [PULL 0/6] Edk2 stable202302 20230320 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 20 Mar 2023 at 09:39, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 74c581b6452394e591f13beba9fea2ec0688e2f5:
>
>   Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-17 14:22:01 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/kraxel/qemu.git tags/edk2-stable202302-20230320-pull-request
>
> for you to fetch changes up to 86305e864191123dcf87c3af639fddfc59352ac6:
>
>   edk2: update firmware binaries (2023-03-20 10:36:31 +0100)
>
> ----------------------------------------------------------------
> update edk2 to 202302 stable tag
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

