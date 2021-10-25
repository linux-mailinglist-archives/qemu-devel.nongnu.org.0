Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34FD439EF4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:07:17 +0200 (CEST)
Received: from localhost ([::1]:51620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5JU-000797-SP
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mf5GF-0005sr-Qf
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:03:55 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mf5GD-0005hF-UR
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:03:55 -0400
Received: by mail-wr1-x432.google.com with SMTP id d10so10532395wrb.1
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 12:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1wAe0yM9lRddYP0z/PQ75mBIXVuPJu8O8DTXKGH+XrM=;
 b=BQPJsf+2aMuXQL99HGG4RTDlkp7HWbMDKMtZbU37wQIJoaUJqEP7o5Z58PYYVL97d7
 82UrIZjj3+9eUti53Fd+TTg2PM/mzmLvlSbBt+nh3MzziAXi1Y76wexsHnjbBhuZrpSc
 gsDiHtZ/zknRa7tzQySy7SJq/RQkPz3GOaSLdGaO64oG+LAow9zwRxIxI3G3qvsRyBYC
 Trrb/bui0az60s5XP+ljdnMkHP8IOziU8iY38Tgk2qF8ENC4Ussxe4j+mC5FybZ9AORR
 xgNIt1/wWBrNr2OvRBqC3jg+Jn+MsFE7W+wg5b4C0vgQj6314Sfqw/779RJXm4Ywl0eF
 eZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1wAe0yM9lRddYP0z/PQ75mBIXVuPJu8O8DTXKGH+XrM=;
 b=2STbC14lMcNBE9tYAGgnM2EgIVUzM5IE/hBg10CV7Dq6F8Anl5IblG7Yz5Q1x/+cXg
 +K3I0+tXWZJGKtfDbkpE5YOzZckAU0ENTACIlvpvcEDeca0oBnduI3aAUsNbvGS4OG3d
 Si19W+qhFQZKA3T/OdutcfZ+DnBmar/kWX89DS8kcKNlhV7xSuMC+0gOsQvu9Ue7mUPc
 sKF+tFQCy9tiBG/mazSyVQrPssjDopW6u+GVH1ZPcZGaBbmKdOuu34srHzt0vSyy7qv4
 3tD5BoJ4ikBEI6BVYHhjaNXfrZnzOlMpL7DBu92sJzxpTkbJZdSnh0/dSKSzUQ2wgluT
 PdbA==
X-Gm-Message-State: AOAM531p+JyZV3srq+j/4wMnmLnDKgoD5TbmM4wRJUutRlBU7OAN7Pvq
 TETqgR7wxz9Wy1kjMjHwBNzlPQ==
X-Google-Smtp-Source: ABdhPJw03ik1H947tszw6bMEfAI3IgpDsKWTzuNCO3dqGK3yrOE1jLbUdKTatSWz+yNg0xpnSCvnwQ==
X-Received: by 2002:adf:fa8f:: with SMTP id h15mr25868665wrr.323.1635188631864; 
 Mon, 25 Oct 2021 12:03:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m2sm8780170wrb.58.2021.10.25.12.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 12:03:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 253921FF96;
 Mon, 25 Oct 2021 20:03:50 +0100 (BST)
References: <163491872706.304355.11795681036780988723.stgit@pc-System-Product-Name>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: NDNF <arkaisp2021@gmail.com>
Subject: Re: [PATCH v3 0/3] plugins: add a drcov plugin
Date: Mon, 25 Oct 2021 20:03:40 +0100
In-reply-to: <163491872706.304355.11795681036780988723.stgit@pc-System-Product-Name>
Message-ID: <87v91l0vvt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: arkadiy.ivanov@ispras.ru, qemu-devel@nongnu.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


NDNF <arkaisp2021@gmail.com> writes:

> These patches adds the ability to generate files in drcov format.
> Primary goal this scripts is to have coverage
> logfiles thatwork in Lighthouse.

Queued with some fixes to plugins/next, thanks.

--=20
Alex Benn=C3=A9e

