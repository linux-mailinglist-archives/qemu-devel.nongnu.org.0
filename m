Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ACC260DBF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 10:39:41 +0200 (CEST)
Received: from localhost ([::1]:53016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFZAC-0005EX-L9
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 04:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1kFZ9I-0003nw-LO; Tue, 08 Sep 2020 04:38:44 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1kFZ9E-0003YX-RF; Tue, 08 Sep 2020 04:38:44 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1599554289; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=LZ6lM7kIOYfwfjz6WdkOqKfnZWLlw/r2p3foBe2nELcHlvohlm+TJmtt//CGMVptRxWxpXKbdKGZoxoF/pC7MiwbxqJ1pBcCqT3bDxUByQnO/vy1R47GQ0K1U2eFPNexV9BxXYTIMSt29YI3eLQxFxzmkza0S9T8DomK8FeSflo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1599554289;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=7qwK0PifuXv8tsWfU93nI8Lgk/I61Eax+VLxXsmw+hI=; 
 b=XLIJwUv8pm8j9RSygZTkQumjimasMzYQHojzjN4rhmCoPxIanun5MsdiocadLpi5eZ4Dbs7g4kKUrCpjKW/1+AqEf4AR1e7i3+AVEF4VYlO1fAhQAkOomhOm65IKZOQ0UTe3AsDFHu2jisGQL94dvhwW0qmPpGM5w4Tp47cvROg=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1599554289; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=7qwK0PifuXv8tsWfU93nI8Lgk/I61Eax+VLxXsmw+hI=;
 b=KEkzP9DjZvaA9tX8eI2UPoYIEpAi7DcC4YIxHbf+DimJ8T8xqbyq77HECKolmr7n
 sZmdIfd8jtFyJFY6eSB1V+Y+HqT46KaUJUL4VoSkVV0us/8vQqRBS/NDaRHTMssi/S8
 yllACF7+QRc/XDqR0BDj7svOtSRJrYsQP8G8r8xw=
Received: from localhost (ec2-52-56-101-76.eu-west-2.compute.amazonaws.com
 [52.56.101.76]) by mx.zoho.com.cn
 with SMTPS id 1599554285567978.5600427130757;
 Tue, 8 Sep 2020 16:38:05 +0800 (CST)
Date: Tue, 8 Sep 2020 08:37:59 +0000
From: Fam Zheng <fam@euphon.net>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: add Stefan Hajnoczi as block/nvme.c
 maintainer
Message-ID: <20200908083759.weoofjvtj5py737o@dev>
References: <20200907111632.90499-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907111632.90499-1-stefanha@redhat.com>
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 04:38:28
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-09-07 12:16, Stefan Hajnoczi wrote:
> Development of the userspace NVMe block driver picked up again recently.
> After talking with Fam I am stepping up as block/nvme.c maintainer.
> Patches will be merged through my 'block' tree.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Klaus Jensen <k.jensen@samsung.com>
> Cc: Fam Zheng <fam@euphon.net>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Fam Zheng <fam@euphon.net>

