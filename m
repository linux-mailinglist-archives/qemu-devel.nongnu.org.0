Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17004586EFD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 18:47:58 +0200 (CEST)
Received: from localhost ([::1]:43720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIYaD-0001mx-5f
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 12:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIY5g-0007OF-Eh; Mon, 01 Aug 2022 12:16:24 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:38803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIY5e-0004YQ-Rs; Mon, 01 Aug 2022 12:16:24 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-31f41584236so114178927b3.5; 
 Mon, 01 Aug 2022 09:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=kpPILohdYZndQZHY6aCK8qYjw01hiwl2xih25mnYRxA=;
 b=gPuXMJ0AjI/AUIBzNntdJNMDtO8ReUwY2Ns/lD+ltRApI+PeU/wUso/s1arkV9S057
 zk37DrtsmlAK0e0XlUx0G9xkCIUk6kY7SjzYKcI39SN68zMmFB6w6Rr6WPEz1gs8I8Xd
 IaUT9rb5syu8d4a7JWBzmq8jKllt210sCwK/aVh2fA5OQ/nqSrj6VU6VhEYumOafre3t
 CW+EWP22E5AMbXRCcxzkwg5mda8fuP9DYSjoaoNi0TyK992Xipp0wbcZyrBLX2DXf/zi
 Ak//EpRbUNU7CHGCk2EWQydQX6FfNdB1tR8bkc6M++A9vSgevDTNbzCBSBxNGw4+Ksmj
 8Dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=kpPILohdYZndQZHY6aCK8qYjw01hiwl2xih25mnYRxA=;
 b=XKI0+OlRMYN+9WXE05zHxYsuiq4cukWX1YaT/7b+tkUwDGkTyUyimGj69dIWQYEgjv
 xeflGAL+NV/9rVlaoIzm+es+UWtbEqUYhZ37fooZ1RFNI+1EFilIfvwEHdiazmsh1gLw
 VoSU7DvK1ceO2M/CYBUAA+bGmKj4vNMc8EIk/lqEbVYjS2TM6yuq/Sn0GrtrGW+jVcYD
 T6nBPOl0utH4T8qxGUbsGTWLuAc6LJLyw/LuagM+y0y1CsTZWTLNcQ68+NOX5k1Y6CBY
 1gzs1ng/Ogeeji4/IiYUCdYgSx+ON2S0qrZk48Jl26vAiVfpu2sFbIHm8Pwlqx6z/0x7
 R+fg==
X-Gm-Message-State: ACgBeo3ZhPnlF1zF0wCw4XitfGpnbBXOSOmMi8mOq+YxLgTlV1iSfEEV
 GhYc9odRfhEUR4akfpVJvgsy/vJZJoVZ0ZvZCvo=
X-Google-Smtp-Source: AA6agR5AEa0IenBJhT7r110LIFdo+YIWodLNGsXk78D4ZtvDWamK9Lbv2P8YxVaBF4KZl88rU2AHAZoyWg2e7CP4nbY=
X-Received: by 2002:a81:af22:0:b0:324:59ab:33ac with SMTP id
 n34-20020a81af22000000b0032459ab33acmr11591179ywh.62.1659370581396; Mon, 01
 Aug 2022 09:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220801012015.4902-1-faithilikerun@gmail.com>
In-Reply-To: <20220801012015.4902-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 1 Aug 2022 12:16:09 -0400
Message-ID: <CAJSP0QV3VH0it=LjDKYgyar4BYzHkpsjPzR5759KJq65ABi+DA@mail.gmail.com>
Subject: Re: [RFC v5 00/11] Add support for zoned device
To: damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com, hare@suse.de
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, mst@redhat.com, 
 armbru@redhat.com, qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, 
 hreitz@redhat.com, eblake@redhat.com, Sam Li <faithilikerun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Hannes, Damien, and Dmitry,
This patch series introduces zoned_host_device for passing through
host zoned storage devices.

How can one host zoned storage device be split up for multiple VMs?

For NVMe it may be possible to allocate multiple Namespaces on the
device using management tools. Then Linux sees individual /dev/nvme0nX
block device nodes and QEMU uses them with zoned_host_device.

For other types of devices, can dm-linear create separate
device-mapper targets? How do max open/active zones, etc work when
multiple untrusted users are sharing a device?

I'm asking because splitting up a single physical device for multiple
VMs is a common virtualization use case that we should document.

Thanks,
Stefan

