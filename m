Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12B66BD84C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 19:43:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcsXU-0001OQ-Lg; Thu, 16 Mar 2023 14:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maverickk1778@gmail.com>)
 id 1pcsXT-0001O7-1h
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 14:41:23 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maverickk1778@gmail.com>)
 id 1pcsXP-0002Lq-V1
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 14:41:22 -0400
Received: by mail-il1-x12f.google.com with SMTP id l9so1525519iln.1
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 11:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678992078;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=w9bAIcoUea+zNN+AOs48dLy+6UB3/IHNusllHa4OOeA=;
 b=CjBMwHetr8gB3C8yNa9LqMh86vCSwwXFAUhaJmcDMHfaKclj7F3kuSTGc36dzAE1Fr
 3yXjFae4PPB/gKcFrRIWdbvp6Fkintf0+HkyGmcJhzdbcKuPvGZTQcrXHFpuFuCVf97i
 PyODPp9g3VO/syi0eseC2o1SsQ5Z8HRqMqlS11poR+KdiWSBgUCRD4AOg1VK9CBGj51Q
 G3xtOv+sazTNnEJqgiGsbgCbVBfKg0gu6GI/1p/3Hg5Ort/5mbYjdvnsUc14hACzOk7G
 tZ7wOH8kK2Iiv2ejm+vuV6P4xrQyf5jn9HnW/3D9f8wCGJpp8IsebU48poTCiZa1HMxq
 mh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678992078;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w9bAIcoUea+zNN+AOs48dLy+6UB3/IHNusllHa4OOeA=;
 b=jQoyh367BjZyW/8imQM4tjDms0TdNN+qyd/IKHfElZAwodJdw1qM/W/ilwiJda4h7M
 ngfDpiON1vMZbzHOGrHDIudvIuB7AlAgm6vY5gazgfTFv0IB21DH2QVHGkwdCanka+G7
 Yi31aSYzMraYozQlMDwxEaZhjwlJTLJNuRqeZkOQ6o51Hoh09RdATmYg9Wq2g2QCRNmu
 MATK99j42lb/1apHqQNEsR18xbSMS3RKMY/8g4IitgLFqHvcAG3Sl36TA/NFApP2IOPS
 DwSNrqHU8lu/QJso0YTOe12ravkQgiBDuYVTsQboa97TbKgWFi041y7gp6VyA4iB8wpI
 d78w==
X-Gm-Message-State: AO0yUKXDv3Oxf+e7BKBAjeOkzGU7E/0HjJ59d1KmBeiBLlgtKNEfr0VO
 zpKgwrl00/ml/Ev3rkgIEwuAp288y7kK8namgTLlE9nqNk8=
X-Google-Smtp-Source: AK7set8TVUphatI7tpQysMbrhHQoYVjLVy1nnes1xW9znbCGekelwiG7gFHKv2q/8D2Aptsn1C1m6kzDR6SdKG5iiDw=
X-Received: by 2002:a92:c5ae:0:b0:313:b6ee:2037 with SMTP id
 r14-20020a92c5ae000000b00313b6ee2037mr206101ilt.3.1678992078147; Thu, 16 Mar
 2023 11:41:18 -0700 (PDT)
MIME-Version: 1.0
From: Maverickk 78 <maverickk1778@gmail.com>
Date: Fri, 17 Mar 2023 00:11:10 +0530
Message-ID: <CALfBBTuELntcARWxvHyGmYvHbEACujhBq8bphHKnUv_C_z33Bg@mail.gmail.com>
Subject: Call failed: MCTP Endpoint did not respond: Qemu CXL switch with
 mctp-1.0
To: qemu-devel@nongnu.org
Cc: Jonathan.Cameron@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=maverickk1778@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

 I am trying mctp & mctpd with aspeed +buildroot(master) + linux v6.2
with Qemu 7.2.


I have added necessary FMAPI related patches into QEMU to support CLX
switch emulation

RFC-1-2-misc-i2c_mctp_cxl_fmapi-Initial-device-emulation.diff

RFC-2-3-hw-i2c-add-mctp-core.diff

RFC-4-4-hw-misc-add-a-toy-i2c-echo-device.diff

RFC-2-2-arm-virt-Add-aspeed-i2c-controller-and-MCTP-EP-to-enable-MCTP-testing.diff

RFC-3-3-hw-nvme-add-nvme-management-interface-model.diff


Executed following mctp commands to setup the binding,

mctp link set mctpi2c15 up

mctp addr add 50 dev mctpi2c15

mctp link set mctpi2c15 net 11

systemctl restart mctpd.service

busctl call xyz.openbmc_project.MCTP /xyz/openbmc_project/mctp
au.com.CodeConstruct.MCTP AssignEndpoint say mctpi2c15 1 0x4d


 The above busctl configuration is reaching fmapi patch and sets up
the endpoint id but then mctpd fails with log after timeout.

Call failed: MCTP Endpoint did not respond

Any clue what's going on?


Regards
Raghu

