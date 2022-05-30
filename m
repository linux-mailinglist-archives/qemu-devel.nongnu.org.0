Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80D05379F3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:33:19 +0200 (CEST)
Received: from localhost ([::1]:44884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvdeA-0001Ms-Pg
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nvdR8-0003eQ-WA; Mon, 30 May 2022 07:19:51 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:35592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nvdR7-0007wk-F6; Mon, 30 May 2022 07:19:50 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-f16a3e0529so13913161fac.2; 
 Mon, 30 May 2022 04:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3H2iYouxFWt++sIm/itjpChdBBg/580KfBGehbn1GbU=;
 b=iOcSDcSbfCKpIy11c3H/ZrugMD3r/SSyT8vCx8qW41pyqTx523lMn6W75nsHERVAO2
 K8uWdOMmst9GhrYfbe2XMhaXi7bGKhZ7Cb/FJUE5vk9HkpVaXEYlLK5kyDzjWx+j/X55
 Z8aOR55igC7w9DRC9Er1JI8peXDtBOs5qmQrYYo+HUnHrm2m1X+wQmwNOj6IEKGDoi9X
 uorS6Cl7q6CIuHyNE0z46zlMEYESRX+CpYsNlt4XCK5rG9JUYLoIFLFqFrdxH4wBEWzU
 c0IcZVVml5XEzkd3UjiiVYG/eybqF2EJPDmOLEhUXp7eYmgOS+SEkcWk9iHgZPrJ5M1k
 dsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3H2iYouxFWt++sIm/itjpChdBBg/580KfBGehbn1GbU=;
 b=Mrqzg8e5A0+sc1SECMkU0nJNumgh4n6S6y7wDNgshVQ49CUmsrcW72a+aW3ZwICKqJ
 henEjCyQNu6XGD/botaMpy/lBa8FQjxQxQZZAWYleS5RO2+YU57Gj/+VwL5z5bsX9UO+
 776NZB4WFJL1DaZtqI3flyD5xQRvWamCFxx3RSKmr7+F/Ml9ltMYtredFDgpweNQxZNY
 17t9ERJx1spysWwqy26i50PoMKyKc+zu0nZcFW1S3E53x5KHmjgt3hy2yZA4maiGqiKs
 gYjQmjCAA4ebos7BCG4/ReXGZ+5pRrzn+vtMFq6aqUx1ceSRcrnzGWqcP4UJlCQv0ZnU
 fGwA==
X-Gm-Message-State: AOAM533zs5gSt/xtMOV6s0pPmSC28WLhVoMd1lOoobs4htZhaTO9iqvp
 cHDGTnyNyauzu5ij4fVCWbwX25SiGc1zOBi2JuA=
X-Google-Smtp-Source: ABdhPJx5wTpDM9swwMAo4CZ43oZ0spfokKD8sb2hCNHM4DOnZoW/ZwAcXIfmbqASmq5Ho/+j9xoFmMcMIW6D9WW3kuM=
X-Received: by 2002:a05:6870:e30e:b0:de:ab76:eed7 with SMTP id
 z14-20020a056870e30e00b000deab76eed7mr10034099oad.101.1653909587506; Mon, 30
 May 2022 04:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
In-Reply-To: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 30 May 2022 12:19:35 +0100
Message-ID: <CAJSP0QURQOD79ixL2j__uBCuaJL19sytKpMr6QT2QY_+VnQPtg@mail.gmail.com>
Subject: Re: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
To: Sam Li <faithilikerun@gmail.com>
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, 
 Hannes Reinecke <hare@suse.de>, qemu-devel <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=stefanha@gmail.com; helo=mail-oa1-x34.google.com
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

On Mon, 30 May 2022 at 06:09, Sam Li <faithilikerun@gmail.com> wrote:
>
> Hi everyone,
> I'm Sam Li, working on the Outreachy project which is to add zoned
> device support to QEMU's virtio-blk emulation.
>
> For the first goal, adding QEMU block layer APIs resembling Linux ZBD
> ioctls, I think the naive approach would be to introduce a new stable
> struct zbd_zone descriptor for the library function interface. More
> specifically, what I'd like to add to the BlockDriver struct are:
> 1. zbd_info as zone block device information: includes numbers of
> zones, size of logical blocks, and physical blocks.
> 2. zbd_zone_type and zbd_zone_state
> 3. zbd_dev_model: host-managed zbd, host-aware zbd
> With those basic structs, we can start to implement new functions as
> bdrv*() APIs for BLOCK*ZONE ioctls.
>
> I'll start to finish this task based on the above description. If
> there is any problem or something I may miss in the design, please let
> me know.

Hi Sam,
Can you propose function prototypes for the new BlockDriver callbacks
needed for zoned devices?

Stefan

