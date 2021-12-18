Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56923479B6F
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 15:41:05 +0100 (CET)
Received: from localhost ([::1]:37996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myatS-0005DU-TI
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 09:41:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1myarL-0002vM-A8
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 09:38:51 -0500
Received: from [2607:f8b0:4864:20::102d] (port=37662
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1myarJ-0003pO-Dv
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 09:38:51 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so5959695pjj.2
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 06:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:subject:message-id:user-agent:mime-version;
 bh=YxlxodGazJvVjyxqdWA4wd2eD96P5f9YNQu2ivcAkdk=;
 b=qN+GKjNFDPDEp5Ef3+1rJwKRWfUwShhMmOCxnNPHjpEI3Ekp9vIaQrO7DBmteXyf/3
 goA/rQgNuLuT3SQmMBOegwxTd9QOzy0Vj7uCDd4erANPlLMjEprGO1I2Pn+GOf0bQ6jK
 Ybp3M1lIYUvHGCuPUf6yRSI4JpZMWBFLuwTLupAHY+CYlG8R4L11kUoUh4zNFmujp3jV
 Z5JOUjT+y7rBQVsuQQphBRW/FKpI5zG/k36cSLgGmKb+CVOQdSV5i6IkGTEiKi8HWWNR
 eerxO1+bk2gu3gJwJmYgFbDt7vXzrhfKp8sNkxi49uAc2LntEsKp5nWYjUZKgalrFMH+
 vMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:subject:message-id:user-agent
 :mime-version;
 bh=YxlxodGazJvVjyxqdWA4wd2eD96P5f9YNQu2ivcAkdk=;
 b=akkceV2TYqWxXg6Y7Ml4fA0RHIb03b0lfHZD5Bij7L06/f1hyYK97USyQUgnAeSe+v
 wD606/n29G5aTrU4o/Qdjm51lPD2yxwFHS9uEGjUbNelj8WsogkoZMW/+Ex/wckCJGZ0
 MI09OHnIOB/6WSlmlUFk9mg15ZypsGHckqx4cPNwA00NLy+iRCkr8k07mm17i7VzlzaH
 7yZisZflZAVmBmIrDRDECpBJWP6TkdaqsjYDahGjRPwl+PRKngO0Yxn18mswyCa3JQ7w
 kegCTdN9SMA5S58MSjqGo0NAn7RJ9Bf4OO9tzV5VatxfbtGvlgjqMEzuERhfGuKbq77+
 nG6w==
X-Gm-Message-State: AOAM5335E04El7GrRqI/vPGPH8H9W7VQUqUkX7VTcdrHY0ASiVAq5y2Z
 mceoA/PDd1n1t6U0OA1zyfdyC4ASegS9hA==
X-Google-Smtp-Source: ABdhPJwchhyZ5QorG8SpZLZ7UeGCPrpa1ifoxrHKkFX8BHJFLMo/a4yIprU+RqIfN3EsajTFPplCGA==
X-Received: by 2002:a17:902:e891:b0:148:a4e1:4fb2 with SMTP id
 w17-20020a170902e89100b00148a4e14fb2mr8171139plg.131.1639838327003; 
 Sat, 18 Dec 2021 06:38:47 -0800 (PST)
Received: from anisinha-lenovo ([115.96.121.67])
 by smtp.googlemail.com with ESMTPSA id lb4sm16283025pjb.18.2021.12.18.06.38.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 06:38:46 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Sat, 18 Dec 2021 20:08:42 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: qemu-devel@nongnu.org
Subject: build qemu on Monterey?
Message-ID: <alpine.DEB.2.22.394.2112182006430.46303@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

Hi :
Has anyone tried this? Yes, I know about
https://wiki.qemu.org/Hosts/Mac

but I am getting

$ ./configure --target-list=x86_64-softmmu
Using './build' as the directory for build output
Disabling PIE due to missing toolchain support

ERROR: glib-2.56 gthread-2.0 is required to compile QEMU

when glib is already installed using brew.

Any ideas?

thanks,

