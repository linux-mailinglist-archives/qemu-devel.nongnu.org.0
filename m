Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4F95FEEC7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 15:40:01 +0200 (CEST)
Received: from localhost ([::1]:33994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojKuv-0001yq-2o
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 09:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojKsG-0006m9-PG
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:37:16 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:47094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojKsF-0008TK-3N
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:37:16 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso3517685wmb.5
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 06:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwEKxf17mVTAxbCVA8zA+vPEBKA0hAons0c77P29dsg=;
 b=K2IVoeg4JUsfPQ3DJYeDvRdxkqLA8VHDLcITUMwZ+l0O2w57X9GiTr+lnBt54Qd1pZ
 jrD6fHvtUMtYh+6g5gDPmu80c48JgOGGd/gbXaqM2zU1hX+LLKgHEeawU8X00bBUQtYd
 dJZkKbVKl0gJRTm94+fs1bGI8lCH+HaMDRm6krMM1z7VNTPe9nsdy6QBU93D+6O6IRid
 V0Gfe9S3Dy0IEesIB7dfp9lnzW24JIvApjKyiAasQl5xkNA3A/+ssZVE8HmclAXAA0Ql
 /V4F95PBvUlh97C1KAN/ZwPddwHBS9WETtUmej7+rboztMklRCCDGdZgKKFr5rWL0szD
 OTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rwEKxf17mVTAxbCVA8zA+vPEBKA0hAons0c77P29dsg=;
 b=kbkCIC5IRVtHppUcXah6h2vl9m74X4jE7JoS6Z8o9B7By6+r8Vhnx8CJ6FiIa+L535
 lc5I/VY/OZI5J0cci0P7DfKz4KXJ1BV0yTQ52BgbmQHOOWXAKuhm4sek3bpPNucHwsYB
 zXDOUop7Rh8z7+n+v8m1rCzLeWTva4pHd/v7FLbAsIykXo2xTz7oqgs/5t9U83Q7DJSl
 bwqMPXsNIq2ipJL75CgIPldUWSNiY9DSZyhMujT/gM5fQLBdpW1Wue1oGR3H21BxgToA
 z/dQwHMkA/M/G95b+3/5xoJ4lUMYOPkZbA8mUdxdh4HrlWS3aJc7gDASROZ03HIl7JIr
 2pYg==
X-Gm-Message-State: ACrzQf3/+klO6P5iANdNFczftPv4kGfu5TY31+tebVCUvsaov5eM9t68
 NxdezayxRMf2Xoo96xq6GwrumA==
X-Google-Smtp-Source: AMsMyM73ypPxDm16x9tW6ij0wYoQXtnXCLLXDl0qvob7vWG7lrRQj/Se1vaTuMBgFi6OXelCeN8vbw==
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id
 bg14-20020a05600c3c8e00b003b4d224ae27mr3698332wmb.187.1665754633664; 
 Fri, 14 Oct 2022 06:37:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a056000114500b0022b014fb0b7sm1904643wrx.110.2022.10.14.06.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 06:37:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A43701FFB7;
 Fri, 14 Oct 2022 14:37:12 +0100 (BST)
References: <20220929180946.848721-1-clg@kaod.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] MAINTAINERS: step back from PPC
Date: Fri, 14 Oct 2022 14:36:24 +0100
In-reply-to: <20220929180946.848721-1-clg@kaod.org>
Message-ID: <87v8ommsqf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> I am not active anymore on the PPC maintainership, degrade my self as
> standard Reviewer. Also degrade PowerNV and XIVE status since I am not
> funded for this work.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>


Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

