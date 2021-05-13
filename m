Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A4F37F9AC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:29:02 +0200 (CEST)
Received: from localhost ([::1]:59200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhCKj-0000pr-Bb
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lhCH7-0004xc-TP
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:25:18 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:39476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lhCH6-0007if-5s
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:25:17 -0400
Received: by mail-qk1-x72e.google.com with SMTP id k127so25614867qkc.6
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:message-id:subject:mime-version;
 bh=9LChy7ZnjlL7cENoyL54XhMMlw52vvqwymC+eOtCkWU=;
 b=WhJ53fquwOVWPKfeglnw/lUpw7MuDVMpdqRV4xZGWEaGMHrx5+vGgve26EpYhJfzkX
 TVgTMznvms3wJ22lC1WxtC1BwXVo96tZ5eAOAc0s/lmr/aLFWdIbQdwDoQzo1mX/9H2N
 GOVjyTvyUAekVCjBDogFENxHH9Ohn9Du8lkWpD6OMUbIGE7Sw1xEyde4XphIZUn/9xmw
 qkUIEXbavUUtUfxbBsB9UGd7bhnAhtt+5YXVzZA11B1iLzXX+2vso8598FbqyW4nvIdF
 N7MiqCTVZw831IZY+WnMujxB/17KDkTyzLTWvx8gtARSMDnoeCWKGayFozPjucsFn3DK
 aOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:subject:mime-version;
 bh=9LChy7ZnjlL7cENoyL54XhMMlw52vvqwymC+eOtCkWU=;
 b=AFs51QjipxOSxcsU3R9N4yLhGfP0BTET7foBpT/LZPbq44x/vT0ayjFGtEnlNIYxyh
 G+/mVa2A2mYoI9N8xOXjC+fhspD/Tu+SH27llRveoZuTDF8kGur0kWD1cSxT90z9WCGS
 UsU2ogn2VQUMYtEmp3+wtB1UEGa06TGoynNgi1b6Ee5h5QdF7twNEQCedMVmUaVuN7g7
 X8tl2CBjCCrzHN4vFKcCQDcs8SO3x9OtTu4qpu611l1gnFwTNj91hjNTFfeyyOkg1xsO
 JbORlDcF7wLWXu/+81QJzCz0QNgjk/AbJ364oQIYsS2rbloi17egNcDb+ZYbFvgbu617
 0g5g==
X-Gm-Message-State: AOAM533ZRKZTYmdwXXSRpw/8/Badq6N6847P2r2pq2C2Im+hrwUwcHuM
 E2XzRLR88KeIvxO1JGDU73GammDC3v4H+w==
X-Google-Smtp-Source: ABdhPJx89RyeKLEkl6GvW/2A7QjCRVTOtpdT+dwdehOO1jS9n/tXpmzXmpxGemK40U6pGpt+fySidQ==
X-Received: by 2002:a05:620a:1021:: with SMTP id
 a1mr2574362qkk.399.1620915914273; 
 Thu, 13 May 2021 07:25:14 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id y6sm2580986qkd.106.2021.05.13.07.25.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 May 2021 07:25:14 -0700 (PDT)
Date: Thu, 13 May 2021 10:25:11 -0400
From: Shashi Mallela <shashi.mallela@linaro.org>
To: "=?utf-8?Q?qemu-devel=40nongnu.org?=" <qemu-devel@nongnu.org>
Message-ID: <6146FAFB-FDAF-4C37-A488-9A0797CB5405@getmailspring.com>
Subject: QEMU SMMUv3 stage 2 translation
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="609d36c7_2aba0ec6_14ca"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_IMAGE_ONLY_08=1.651, HTML_IMAGE_RATIO_06=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_REMOTE_IMAGE=0.01 autolearn=no autolearn_force=no
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
Cc: "=?utf-8?Q?peter.maydell=40linaro.org?=" <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--609d36c7_2aba0ec6_14ca
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

Since the current SMMUv3 qemu implementation only supports stage 1 translation,wanted to understand if the implementation could be extended to stage 2 translation support and if yes what is the overall scope involved.This is required for sbsa-ref platforms.
Thanks
Shashi

--609d36c7_2aba0ec6_14ca
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hi,</div><br><div>Since the current SMMUv3 qemu implementation only =
supports stage 1 translation,wanted to understand if the implementation c=
ould be extended to stage 2 translation support and if yes what is the ov=
erall scope involved.This is required for sbsa-ref platforms.</div><br><d=
iv>Thanks</div><div>Shashi</div><img class=3D=22mailspring-open=22 alt=3D=
=22Sent from Mailspring=22 width=3D=220=22 height=3D=220=22 style=3D=22bo=
rder:0; width:0; height:0;=22 src=3D=22https://link.getmailspring.com/ope=
n/6146=46A=46B-=46DA=46-4C37-A488-9A0797CB5405=40getmailspring.com=3Fme=3D=
2a4b90d6&amp;recipient=3DcWVtdS1kZXZlbEBub25nbnUub3Jn=22>
--609d36c7_2aba0ec6_14ca--


