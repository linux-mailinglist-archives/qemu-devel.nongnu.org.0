Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EC733CE1B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 07:50:50 +0100 (CET)
Received: from localhost ([::1]:60126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM3XW-0005Se-03
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 02:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lM3Vx-0004aR-DR; Tue, 16 Mar 2021 02:49:13 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:32822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lM3Vu-0006HA-UM; Tue, 16 Mar 2021 02:49:13 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c16so16506048ply.0;
 Mon, 15 Mar 2021 23:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=ScePl3OlcwMEtltuoGLrOVo2a+EsqlWOeyAzA1fEQiwDd97jXdBjYQe3P6Pr+JXEK6
 AVn/htYMGP/63Q3q0dLRxz7rbYNsZ8WMzxwXPtVNFvJN/fBmird+JJWWxZnuJpFVEGh6
 A+VpFqOUZZ4WN6GxV8aKmkUGAPEs3mgF3uCf1Sn9111onphRYhS8z6rGEtEd6C1dsoK6
 APbswTBF5CA1mqc4mOBeJYsGYIKOHP0Vxi2C8Kyp4lM+91f+6KL9Ga9YjFdfvmDBG3ec
 eujloyt2hWy3UutXzIzrPNaNk1LSSSl6/ABip4HdF46VXttK1lhYrqRxpPDS4umJ3EVg
 BmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=SdbhmZX/R/fME7A29LNHdHepMoUTT7NGyF32XBP7R0CRnitgmwz+mGGCsBXWSVLl6a
 69UwqmaLKUPbFZ7zff/+8bD8pdO8oJ/lRTXRM/k4T/3IMpNh3mh7QMg0TcXYqFeDAmFZ
 rakLPqKZvTOmjIlxUANz7jtBHKMSKJ3kOGvVoX8VuDFsxsnYF6x/cl95UgP2bBdLGOwE
 D+b+7aUUkBgm24TpqVc8ZvdzV2NgktGgSsB3N8nMVFLwMTIt0RTK7pdEZKX2Wn0GB1a+
 cdVkzzNm80Dlvx6D+zgx6DPJQiqOocDmm4rH59/KdLx1JwBerkbs0UWUYVtnw9iif0OQ
 dU9A==
X-Gm-Message-State: AOAM532bvCM2qB2cxq98omeTiKQ+KMRxrqVwLXrRvKXfzGu/+I1H0wFo
 QR63eyDWJDse6++BLGivivc=
X-Google-Smtp-Source: ABdhPJzsfedhAg1DAushOJ6rdH5dp+OMf1ZFKOlluReFq9jJeqF4jV3iPkjXJIEyHtQeRDz/Z5Pu9Q==
X-Received: by 2002:a17:90b:b0d:: with SMTP id
 bf13mr3270133pjb.7.1615877349078; 
 Mon, 15 Mar 2021 23:49:09 -0700 (PDT)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id y17sm1717377pju.50.2021.03.15.23.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 23:49:08 -0700 (PDT)
Date: Tue, 16 Mar 2021 15:49:06 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v5 08/13] hw/block/nvme: pull lba format initialization
Message-ID: <20210316064906.GB23761@localhost.localdomain>
References: <20210310095347.682395-1-its@irrelevant.dk>
 <20210310095347.682395-9-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210310095347.682395-9-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62e.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

