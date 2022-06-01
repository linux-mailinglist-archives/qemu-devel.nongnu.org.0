Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BD453A066
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 11:31:25 +0200 (CEST)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwKhG-0002dz-0f
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 05:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1nwKeo-0001p7-SC
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:28:50 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:46617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1nwKen-0007ob-95
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:28:50 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 r3-20020a9d5cc3000000b0060ae1789875so814627oti.13
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 02:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=0K53pSjT6eN/0tFTyxz235dckCu3kdIUOIdB1gEcfGQ=;
 b=VKd6AzDRxWfQQ54/9lxGoe4nx+7gAEAcBBY3Tzao37grg+5fzT8JkNh7di2IF2nBml
 2dyYenlMe7Zdu5dwaBpB4OA+HXKdyk0yfywwidOZGDMUaFHLbIpM6se09AmIVbgc/faK
 I06FFu9ceFN2S31oT9AZcPh9VBgrivp4kywPPkyqU2i4LbdqKUh9tFblooL540BAi61/
 IMb/EFjO+UJHoKYhWw4zjQZ/HrW1x62LnmuTFqQNgYV6xrdQ8ME+kQTFqDwnYH2l9c6A
 0rwvtbXN8S5Pdr8cIf8coQtwaoFORJYSkEz8ey19cMvyHmHIuq9nmk2Bdmx7tjDcUF3Z
 wbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0K53pSjT6eN/0tFTyxz235dckCu3kdIUOIdB1gEcfGQ=;
 b=G6A2Qylwm8Z61ozJmLNwPlLGI6qRrbWtDRyNXri9D8bsKbD5isp/9VEBBDqhW6Qo1a
 xTNPkBhZIwPziEvSHjfxFxsk9It88RNhIPqtiqmveFgC6He0y3piiiwEAFDuerQrJ73D
 ELX7gR/eCG+NjGw+SQKlla3pfBY4nJeSCX2UGtuDb92ohSBNMFPnw4jkMFTRa5Nv9TGT
 H1kJphVfwHO2OjWJsWorPD97kT6CN76Rxya4l5IH8GIugFNAucagVP0NPhMW4xpHLGOq
 941ADJcBnWJ17na/pk7/5ZJxc8m50HjdP5oMUBK8hoFe8Vo+0vkOtT9Uztv14HORQHaz
 6hWQ==
X-Gm-Message-State: AOAM530vcvAJKaojjn074uosoJv/UAXb43BAJEJbOJHN7Dc30HYJ63fC
 fp76tCSttIrbYIQI4K2+z1JcStU/Qi5S1LW5sxwdWHIL
X-Google-Smtp-Source: ABdhPJxPLBu6Y7lGHD4H4Rkd2IqjsXB5I6vqulaajyQG9PK614wq7kIp+9zKhtBF3rrsQew/8c6mWUwEAf9KCXn9X8E=
X-Received: by 2002:a9d:761a:0:b0:60b:6c4d:414e with SMTP id
 k26-20020a9d761a000000b0060b6c4d414emr7710893otl.25.1654075727290; Wed, 01
 Jun 2022 02:28:47 -0700 (PDT)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Wed, 1 Jun 2022 05:28:36 -0400
Message-ID: <CAK7rcp8ukcpWLgcDozdMBnzrOh-qq_b9bkukBNqXYb=XbUYr+Q@mail.gmail.com>
Subject: Types?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000002828c305e05f84e4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=kennethadammiller@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000002828c305e05f84e4
Content-Type: text/plain; charset="UTF-8"

Hello,

I am working on a qemu target under development. and I am wondering how I
should differentiate the MachineState from the MachineClass.

--0000000000002828c305e05f84e4
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hello,<br><br>I am working on a qemu target under development. and I am wondering how I should differentiate the MachineState from the MachineClass.</div>

--0000000000002828c305e05f84e4--

