Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE9F4AC4E5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:07:29 +0100 (CET)
Received: from localhost ([::1]:42786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6Y4-0003hZ-GR
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:07:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH5h8-0004PQ-JR
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:12:46 -0500
Received: from [2607:f8b0:4864:20::62d] (port=41874
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH5h6-0006BI-21
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:12:45 -0500
Received: by mail-pl1-x62d.google.com with SMTP id z5so11344902plg.8
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 07:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=UE2ELuaOjL4CpCjGV4ZNUOhAcx8sKS3y+IJDszRCkFA=;
 b=ff8tEaP5f1G6GY+YwfPvxrFHB2iPoVD9I1VZWC6CcDn5yOTjfPbgskp3XVw88HRlB3
 k2ASTs5CkbCkqvn5gjuuLJQ7vT1Rk9gci6FeHvfovE4wJU6UUnmzCwAv+5CkGtN21cpy
 4V2xipigJqkEn+BJARsK28yHvbw736NaZ9FsGg1TbzxsA1r10EJvsyROeYFMK9i7QTX6
 H2tVyJAQuY4B9M3QOTEZrLOxeyPS3S8tfBJy/EMFmZ353chw+BROoetHq4RarIRd9lUn
 mpqntqIaZICfHpayL8kmGwCtKksoW6erPusjMVxcQc4j9tx/RP+rCx540CpxBxfNEeRh
 5HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=UE2ELuaOjL4CpCjGV4ZNUOhAcx8sKS3y+IJDszRCkFA=;
 b=x3Mid+2B+GCpnSgATU3dQkQ2lU0lmW6TI7EH7DIMjTo4OBuzlugZBWdHxF3kMJJ//Y
 H3knECe8g9UfJu6JA8UEA8K0UVm7ExQP08Z7Qwo4sWwqNkqn5XcvjE5mQ3pAABhCv//W
 F6/5wuLUMjv1ZscdGnMl/jRi2WXY1lFUm5yJmZoCw6FFs+ZsaEugdW6D8I8za8q4ItsW
 Gz5BYfxwf0StT76FjdcgCdjn5D/ChRY6xOQp8TXL/7bId3KV69UGkcI3Z9PoZWpSag/V
 ma4YTginQFb7GOebAihzWMqi/xswt5ttCVIWFWl5CJZ++sBBwuu6UX0OPURhgtOigimW
 Re2w==
X-Gm-Message-State: AOAM531g9146Aff2JndhAiIKEhukf78LHaiOOjyJpU+jOpqSYTDwEuNT
 VzrMVch/lroDeiov8kTntPojCA==
X-Google-Smtp-Source: ABdhPJz7bIiPP3/6DNB84PvJGzuStFzkhzz7VPPGf58tmao4GVrjIdPvNhx3wSZWv7ARJdDvHXh9LQ==
X-Received: by 2002:a17:90b:4b01:: with SMTP id
 lx1mr19154503pjb.158.1644246762383; 
 Mon, 07 Feb 2022 07:12:42 -0800 (PST)
Received: from anisinha-lenovo ([203.212.242.56])
 by smtp.googlemail.com with ESMTPSA id m1sm13102308pfk.202.2022.02.07.07.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 07:12:41 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 7 Feb 2022 20:42:35 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2] hw/smbios: fix memory corruption for large guests
 due to handle overlap
In-Reply-To: <20220204103423.71ec5c6b@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2202072040490.2536804@anisinha-lenovo>
References: <20220203130957.2248949-1-ani@anisinha.ca>
 <20220204103423.71ec5c6b@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, gsomlo@gmail.com, kraxel@redhat.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>
> So question is it is worth to have legacy SMBIOS code and introduce a
> new handle layout + memory_region re-sizable SMBIOS tables like we did
> with ACPI ones.
>
> That way we we will be free to change SMBIOS tables at will without a
> risk of breaking migration and without need to add compat knob for every
> change to keep src and dst binary compatible.
>

Could you please point me to the change on the acpi side so that I can
study it and look into the refactoring for smbios side?

