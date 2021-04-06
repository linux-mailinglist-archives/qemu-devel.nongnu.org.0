Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DBE354CE2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 08:26:21 +0200 (CEST)
Received: from localhost ([::1]:38080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTfAK-00033F-Ha
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 02:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lTf7l-0002VD-79; Tue, 06 Apr 2021 02:23:41 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:46075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lTf7h-0003m5-Sb; Tue, 06 Apr 2021 02:23:40 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 ep1-20020a17090ae641b029014d48811e37so1850128pjb.4; 
 Mon, 05 Apr 2021 23:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IPC63IyxGfiSLu3/3Xz0C/o75+HKQbj/usMGFSYYJRY=;
 b=q1P1bJvkxC6KK1Wcr8SWi7RxfzAH0QMm+/80/ydAjAUvy/u1Sx4wYH5duQhvO3lTIw
 UVOPJoj+bNw2L4tk2MsKgKi+IfmMOG266mgwDmkRXO20Q65esCS3VKcvrvsuONh+QRnO
 3pyKJ59LKUGSJRZpmFBoO6tqzhIB2F74S7Zt6Vu9Ocxn0PRa/ZfgJ+unUeJZfWyOLb33
 NRjFNodpDToyj80s0FWwYgGgoTrQ/LZsHCNNsexdZ0DapErBWFHb1WOzNn8CRlyd12i2
 ZMH6oX1Hsitk/Sue1IuHJ7RGLws7t5dkNVpJ8OwBySiyUFuj65iM0OAH4X0xG+rCyjQg
 XoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IPC63IyxGfiSLu3/3Xz0C/o75+HKQbj/usMGFSYYJRY=;
 b=gfFe9b5wyZQWTV3m0/KfuuGGoHHQTZn2PlQw9lIqWuZ4odH4BxGuD1Nf9StuHE5CAp
 26yMmqynVmADO3oheUVoWoNr7a4DSo2XfUbpkRjEvXpGIFLwtZoX4+wrVJfEmHslvDal
 70Padha73tFjZ0OpGJm5PMse63bw0GLzZ5MrpwpuNtNTTIaArUm/f9IyIu5w50rgIVU0
 47B+bnsTpPc413S1q98Jtrt8UNzFerA9k4mIC7WA5ag+QPPcs3Du7/8e32n0Ek8yvCib
 Jhwpq9wqzQO+jvt1GjXplFoYydkSMuQEiazGJNyExlqhTTexsxpbJmTu/1m6ScEpwhP3
 ptrA==
X-Gm-Message-State: AOAM531vMd808VmUrUMfGWjd8wXFQFogXrmWyIp12BvLDfJD6keQqClO
 oMFngZqTxtvpHeGDmsEnPTY=
X-Google-Smtp-Source: ABdhPJwSOyiQd9PU045eCM9p242YkyYOoGbaftNWS6kKhLLXSjE2oivOY0Msb57GtUnYwwcIW3tDkA==
X-Received: by 2002:a17:90b:4b0e:: with SMTP id
 lx14mr2820590pjb.147.1617690215479; 
 Mon, 05 Apr 2021 23:23:35 -0700 (PDT)
Received: from localhost ([58.127.46.74])
 by smtp.gmail.com with ESMTPSA id b186sm17743261pfb.170.2021.04.05.23.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 23:23:34 -0700 (PDT)
Date: Tue, 6 Apr 2021 15:23:33 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-6.0 v2 7/8] hw/block/nvme: fix handling of private
 namespaces
Message-ID: <20210406062333.GB2594@localhost>
References: <20210405175452.37578-1-its@irrelevant.dk>
 <20210405175452.37578-8-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210405175452.37578-8-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-04-05 19:54:51, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Prior to this patch, if a private nvme-ns device (that is, a namespace
> that is not linked to a subsystem) is wired up to an nvme-subsys linked
> nvme controller device, the device fails to verify that the namespace id
> is unique within the subsystem. NVM Express v1.4b, Section 6.1.6 ("NSID
> and Namespace Usage") states that because the device supports Namespace
> Management, "NSIDs *shall* be unique within the NVM subsystem".
> 
> Additionally, prior to this patch, private namespaces are not known to
> the subsystem and the namespace is considered exclusive to the
> controller with which it is initially wired up to. However, this is not
> the definition of a private namespace; per Section 1.6.33 ("private
> namespace"), a private namespace is just a namespace that does not
> support multipath I/O or namespace sharing, which means "that it is only
> able to be attached to one controller at a time".
> 
> Fix this by always allocating namespaces in the subsystem (if one is
> linked to the controller), regardsless of the shared/private status of
> the namespace. Whether or not the namespace is shareable is controlled
> by a new `shared` nvme-ns parameter.
> 
> Finally, this fix allows the nvme-ns `subsys` parameter to be removed,
> since the `shared` parameter now serves the purpose of attaching the
> namespace to all controllers in the subsystem upon device realization.
> It is invalid to have an nvme-ns namespace device with a linked
> subsystem without the parent nvme controller device also being linked to
> one and since the nvme-ns devices will unconditionally be "attached" (in
> QEMU terms that is) to an nvme controller device through an NvmeBus, the
> nvme-ns namespace device can always get a reference to the subsystem of
> the controller it is explicitly (using 'bus=' parametr) or implicitly
> attaching to.
> 
> Fixes: e570768566b3 ("hw/block/nvme: support for shared namespace in subsystem")
> Cc: Minwoo Im <minwoo.im.dev@gmail.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

Thanks for the fix.

