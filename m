Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62048650BEE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:42:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F7K-0008CQ-VY; Mon, 19 Dec 2022 07:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F70-0008Ab-Ox
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:18 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F6z-0006Tv-5i
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:18 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h11so8387025wrw.13
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hl+ytaNCcuCMyl2tf8rl7C9GIYWjl5dbEWSsuJmYAmE=;
 b=h2nSdxwTU324VEksVRkVh/EwbXXlidlnPqRUS18mxoqI8iuul530bg6r294Xa74I61
 NDe35jneIvXlX7shuUARjwfzqqzLaV65oSypFxyTrEDxaTwitLZC4V3KSXUk7YgoIbyF
 pwaBWLP4Sw5osyQBVaW2IOgr/mfZJ5wLpiP/80rAS/du7pgOUr2y1tD9JlmSsbFjBXST
 3w+ysoHWdDYACjbFghozeGYDYNNGAEKpKLXBZ/2qs8/qt+WX34w3lsJXp1fEX5gwkH4d
 r0+9VwB66Catnh+QuypZIuKcTmDgAb638e7SH1SGSQNbowk9Y5354WJ9fiDpaOzHr8ZA
 Y7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hl+ytaNCcuCMyl2tf8rl7C9GIYWjl5dbEWSsuJmYAmE=;
 b=RHWnO8RrCFqh5K0aIFrfI5cDAYPey4i/x57HqJAb3E1CofxNZnb03LX45RImgll1jz
 PQzRB2vNaGWXQ1Yue1mku/d1Lp2+foXAZQygUqMAamL9j+fqVGdsUulSvAj2l5GI7t9E
 KDtijGKRvX4GkthP1K4YCC2L+6T6mC8FDN8PZI8qLc8icDf2rDbwgE/rX3fs1uEYqR3l
 gfyE15/i5EPOV1jCJSkN65pS/ihahCPEkHP73foxnTijlAgnDlqqE2r1so/qiJZChsla
 7uLEsQUnYyuwWu638uCT7A06pcq+e5ulkFMaWKGGj/YNgyweH1/he+fjEtgB/u2GnIl3
 eOiA==
X-Gm-Message-State: ANoB5plOaj3wI4t7wajxRNaK/fL6V4wvpJg8wucnFoXxvqfN9kqpci0N
 hkPBwMsqsVevSu0IJqbUITc8tS/x8X6VVbiZ
X-Google-Smtp-Source: AA0mqf5xTNyIqeqbFTA3lNgRRcO39TDUk6w0IELQQ8PUrC4nGkd+bvYzrajXu4GymkkvDDpv5ktK+A==
X-Received: by 2002:a5d:438f:0:b0:242:43f3:894c with SMTP id
 i15-20020a5d438f000000b0024243f3894cmr24169790wrq.28.1671452355420; 
 Mon, 19 Dec 2022 04:19:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a5d4d84000000b002423a5d7cb1sm9775848wru.113.2022.12.19.04.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 04:19:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B37E1FFB7;
 Mon, 19 Dec 2022 12:19:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 00/11] gitdm metadata updates
Date: Mon, 19 Dec 2022 12:19:03 +0000
Message-Id: <20221219121914.851488-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Hi,

As Christmas approaches Santa has asked to make sure our lists are up
to date so he can see who's been nice (there is no naughty when
contributing to QEMU ;-).

Thanks,

Alex.

Alex Bennée (11):
  contrib/gitdm: add C-Sky to the domain map
  contrib/gitdm: Add Rivos Inc to the domain map
  contrib/gitdm: Add VRULL to the domain map
  contrib/gitdm: add a group map for SiFive
  contrib/gitdm: Add Ventana Micro Systems to the domain map
  contrib/gitdm: add Tsukasa as an individual contributor
  contrib/gitdm: Add ASPEED Technology to the domain map
  contrib/gitdm: Add Facebook the domain map
  contrib/gitdm: add a group map for Google
  contrib/gitdm: add Idan to IBM's group map
  contrib/gitdm: Add SYRMIA to the domain map

 contrib/gitdm/domain-map            | 7 +++++++
 contrib/gitdm/group-map-facebook    | 5 +++++
 contrib/gitdm/group-map-google      | 5 +++++
 contrib/gitdm/group-map-ibm         | 1 +
 contrib/gitdm/group-map-individuals | 1 +
 contrib/gitdm/group-map-sifive      | 5 +++++
 gitdm.config                        | 3 +++
 7 files changed, 27 insertions(+)
 create mode 100644 contrib/gitdm/group-map-facebook
 create mode 100644 contrib/gitdm/group-map-google
 create mode 100644 contrib/gitdm/group-map-sifive

-- 
2.34.1


