Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696013F6DA4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 05:21:16 +0200 (CEST)
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIjTW-0000sS-Sc
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 23:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIjSL-0007Zd-Is
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 23:20:01 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIjSI-0005Tw-K3
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 23:20:01 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso3177144pjh.5
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 20:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vk1ERYAxh7WiDbUptE3GsUILJa4dIx9m/eCmNh7y2xA=;
 b=SB8GjP76sChpi8M/xAPnLfFv71yFi2x6vz2e5oNA5woFDVbR0j+mrN+8kEijq7gAsb
 cgtZa1MejdRgeKeYsD9AA4QT6JVAnYyBOxahfGeHbPB18YGkPNaT0ntNSDYO+haVgIw/
 RDND0e+iMjiDmDX2Vh8U8uKtIskriLYtZbOKL4zKk6o0ZDeWb8IQUGKfhCijEThGZvOm
 S0M4kIEEPAqVUcEKh5L0P9UTUW/1wCEiRVKOmNLggd02rZl0zSIfKtelJhZx5MBrVVaF
 R9HDWMtMSJn7vJrOMv0KyE48YtIlS3fIC6meBzm5Q04mNihVP6e7FLKlJT3l6rCcrf8T
 TgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vk1ERYAxh7WiDbUptE3GsUILJa4dIx9m/eCmNh7y2xA=;
 b=pD0Ec/s5ovrR2XL3/g0hGjmtvbN1GoBBlhu2bhDMICtHosqJKEbc3GjWl5ue4zWVvE
 kcVg3gWRMKdbF+jWsys4dSLU0tADE1vTmkaDMXZ8U9jpXYlWaNdfHR/HAwToOn1MywiL
 9Y4hW8/EhRBB5uOY3/+h/C+CLqj6zHiOta8/XlX4LEDys4/u2QYl+XhdZ3FYK445fct4
 EleCCnrgR3SgiMtIW59EUR3ejXo5TSNmJGkZBny0dcMO0eGhQuGTgotaWMLFi3SfjUey
 +73THRRodS4nNIGH7GRHuwpNck8aRZizPza8C7tLOd0DL2NL8YYhiseYK3ASoGYuzMpc
 IiQg==
X-Gm-Message-State: AOAM532j9PphCqnDOWfqKbAYSMpWPlNDxTUNqXYVBDEgYndtkdkx4aXk
 kvNtV03tx79xb7TuB/ZaVe/vMg==
X-Google-Smtp-Source: ABdhPJy1rggNiXzpIAFl0KUMFhdzYJOPKppxX/4O93x9G81OBjjUf8hb+Gzy4/xozF48DiX5Zma/ag==
X-Received: by 2002:a17:902:a5c5:b029:12c:a867:a839 with SMTP id
 t5-20020a170902a5c5b029012ca867a839mr36333955plq.71.1629861597052; 
 Tue, 24 Aug 2021 20:19:57 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.155.195])
 by smtp.googlemail.com with ESMTPSA id c19sm3404895pjs.1.2021.08.24.20.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 20:19:56 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: mst@redhat.com
Subject: RE-sending reviewed patches for inclusion in next PR
Date: Wed, 25 Aug 2021 08:49:44 +0530
Message-Id: <20210825031949.919376-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: ani@anisinha.ca, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael:

Now that Qemu 6.1.0 has been released, as per your suggestion, I am sending
all my reviewed and queued patches in this patch series for inclusion with
your next pull request.

[PATCH 1/5] hw/pci: remove all references to find_i440fx function
[PATCH 2/5] hw/acpi: use existing references to pci device struct
[PATCH 3/5] MAINTAINERS: Added myself as a reviewer for acpi/smbios
[PATCH 4/5] hw/acpi: define PIIX4 acpi pci hotplug property strings
[PATCH 5/5] hw/arm/Kconfig: no need to enable

thanks
ani


