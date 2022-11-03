Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A30618325
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 16:44:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcMX-0003KO-Fk; Thu, 03 Nov 2022 11:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqcMR-0003Fi-5U
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 11:42:32 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqcMI-0002tl-4S
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 11:42:23 -0400
Received: by mail-pg1-x530.google.com with SMTP id h193so1978136pgc.10
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nBIKnLDMhcibJ2gSP+r/dADafuY+dFRL+EozOlJmqXU=;
 b=mMf1M/D2eSVf+q0dJLsDRso9FHZNvJ3Oryq7WMqEsFIgxPT1qI+H0MsUwSbwBvaYLF
 LhYEz/oOyyf5zQVjBE3b4kUcnjZKJWAh5XlRuRaejrF8FV5gSW13xoadwe1iyv2CricP
 WgWUjMYjtx5WPMLXkjoubYO364zWVSRIv7SWU/Fh7uM+VzxWKAq2zcQtjjiZ0Bf1C79t
 aArMn/8NomrNC6/B3GJmn/dwhnf2zNKkSmRbjKmCG7E/JVMrfecxXXzCPMP/Ftq8wXOr
 KzlmUmwobzc6C64U7H6wmwTG4iUYwJdeX+ps6UfPbwtpTOkTzbGMKwIpXfwDi2mgdQje
 14/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nBIKnLDMhcibJ2gSP+r/dADafuY+dFRL+EozOlJmqXU=;
 b=7VAfD8oeAxF5p+1bBccaY3Oc4dRL7aCECggoP3aCea4LCkRFD0zbUTHWDe++Hda/0v
 9pWyGmZ/JHNXkGP8vYt9qwrPcCgmEjAR0K+aKcqoEaRn0isOUeCZFkt6o2hr5fE/TB6H
 4Mk3DqFJ7Wt55A/YSodlLHAf17M9FMP57UAbu8pAJm1S4c2G5eDFkEgTxqS9hnTNRKOv
 Ej6IfiFCUZPWJBZsTnb55DK4roKXzueygyxyYJD4RH5VZMxc+Gaf2sR5xzQO5JMZLZtW
 Cks3eVgPjVYIrY/WyaA4C3ABacp21XC8wjk6I7lMX910wF9yK+YNPsLVDMKQYHlH6nox
 l9aQ==
X-Gm-Message-State: ACrzQf0sb3LPALmZ4ySgep9GiTB8p8t1YHGwrZSgiBAvOc6q7UMmkFv8
 V1T3Qldk5sDPfMehcXSefWgccw==
X-Google-Smtp-Source: AMsMyM7+1Ad0/LLDx/z1AGJI0ZAVwYPT6QGabrOqrjvdKHtWMU+oCVIwi7nPdZZFK5/Pwcfx5cPJ1w==
X-Received: by 2002:a63:4042:0:b0:43b:ddc8:235 with SMTP id
 n63-20020a634042000000b0043bddc80235mr26983768pga.498.1667490133842; 
 Thu, 03 Nov 2022 08:42:13 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.157.202])
 by smtp.googlemail.com with ESMTPSA id
 pc3-20020a17090b3b8300b00212cf2fe8c3sm6961162pjb.1.2022.11.03.08.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 08:42:13 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: philmd@linaro.org
Cc: mst@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 stefanha@redhat.com
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
Date: Thu,  3 Nov 2022 21:12:08 +0530
Message-Id: <20221103154208.91501-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> To pull this image:

> $ docker pull registry.gitlab.com/qemu-project/qemu/fedora:latest

Actually the URL is:

$ docker pull registry.gitlab.com/qemu-project/qemu/qemu/fedora:latest

> (or to be sure to pull the very same:)

> $ docker pull 
> registry.gitlab.com/qemu-project/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26

Same here,

registry.gitlab.com/qemu-project/qemu/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26

See
https://gitlab.com/qemu-project/qemu/container_registry/1215910

