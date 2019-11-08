Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98E1F428E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 09:53:16 +0100 (CET)
Received: from localhost ([::1]:50692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT014-0005JD-FL
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 03:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rosen644835@gmail.com>) id 1iT00B-0004s3-Gq
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 03:52:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rosen644835@gmail.com>) id 1iT00A-0006yt-Lf
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 03:52:19 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46298)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rosen644835@gmail.com>)
 id 1iT00A-0006x6-Fy
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 03:52:18 -0500
Received: by mail-wr1-x429.google.com with SMTP id b3so6016506wrs.13
 for <qemu-devel@nongnu.org>; Fri, 08 Nov 2019 00:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=47Wz6qxrky7qiO+w3/Ek2KojVRm3vlBuNXdkkVDZt+8=;
 b=ZxYPGKSLlXTFjjdLhifBKX1B3BV2qaS/8rgfMFckm5wB+ZmnfaHPclT8SCsBrqOmxz
 /TOBZhIvx9bCSzeGsk8P07A188FbGJk/6KX/COmmwOf4CqIOSvx1Mnwx2FIODmg1113d
 XNoZsGEqZzf67kqTmuPsYW3U5AyxjA37J/BpgFpMRAG/D5AkWPMfmupesYZLY1juosn7
 LKijfs+w4AZFjrR/l/kJPjsEH8KfJfKGP5PZ6J4ODkBSy5cDDRAiOjLCIa+D/srYq41V
 PZJ5j0Ailvs13Z++dyOgKUj6YZhsFdCZ4bei8R9UAQqXgGMHr11YJRL3Ybylkse99mBN
 rQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47Wz6qxrky7qiO+w3/Ek2KojVRm3vlBuNXdkkVDZt+8=;
 b=gGmTtE5rapf6KW28dsNNW8kj/JjBZAOIHMiA8jbtlbPM8kMnYv3Yns8XFYuG/vVMlA
 L/4YNGrVUa9TlkeQrWA80wTQDFiAPd3R5HjdCpFgMxGtgSxLwoQwNUsmSWkU/aWh96RH
 1kxxwUIcEQPeWxwlpGHK4wf6KK64blAP3IfMJBaWdGhAFdDcFfKRmKzo1nyhKWnhUdgd
 EyaSNA7F1Irvfgis3amqk2myW6NA8dsxOc1GPuyYfYRYkNq/qDDJoDHJhtJuXIuR1mZ6
 Od+xfj4Wd4yLLF/X97GQ9FX/0tO/1+nV/0aGBIoqD6F6PfXE2011c9uYT/g1a5F/Dmdm
 1v3w==
X-Gm-Message-State: APjAAAUUC3e7G5S9LBD8fJ9c66/XwGcSpJcyfPcmxDrqDlC6Jd0y8f3X
 M+Dj8bbncox/FtUd7Vis+nk=
X-Google-Smtp-Source: APXvYqyfrNata9cn/gzZ5W4JFQSPBlspNNxDyr8XbIE8AJYWEsyJOa9enub3U4//QaCPJd+Dl2b+RA==
X-Received: by 2002:a5d:6181:: with SMTP id j1mr6915481wru.251.1573203137187; 
 Fri, 08 Nov 2019 00:52:17 -0800 (PST)
Received: from localhost (88.50.134.37.dynamic.jazztel.es. [37.134.50.88])
 by smtp.gmail.com with ESMTPSA id u203sm5222375wme.34.2019.11.08.00.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 00:52:16 -0800 (PST)
Date: Fri, 8 Nov 2019 09:52:12 +0100
From: Miguel Arruga Vivas <rosen644835@gmail.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [Qemu-devel] [Fail] tests/test-util-filemonitor fails
Message-ID: <20191108095212.42146a03@gmail.com>
In-Reply-To: <20191105095459.GC41709@redhat.com>
References: <20190808020723.GB26938@richard> <20190808080229.GA2534@redhat.com>
 <20190808084653.GB32524@richard> <20190808092213.GB2534@redhat.com>
 <20190809000609.GA4201@richard> <20190809091214.GD13660@redhat.com>
 <20191104171624.6e62c112@gmail.com>
 <20191105095459.GC41709@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
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
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Daniel,

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> This reported bug was already fixed in git master with
>=20
>   commit bf9e0313c27d8e6ecd7f7de3d63e1cb25d8f6311
>   Author: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>   Date:   Wed Aug 21 16:14:27 2019 +0100
>=20
>     tests: make filemonitor test more robust to event ordering

Thank you very much for your patch and your quick answer.

Best regards,
Miguel

