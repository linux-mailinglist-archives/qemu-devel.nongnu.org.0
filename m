Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8664DC848
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:03:30 +0100 (CET)
Received: from localhost ([::1]:46164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUqiv-0001HB-Cs
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:03:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nUqeh-0007SU-09
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:59:07 -0400
Received: from [2607:f8b0:4864:20::22b] (port=35489
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nUqef-0003wB-CO
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:59:06 -0400
Received: by mail-oi1-x22b.google.com with SMTP id e4so2601636oif.2
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:from:to:cc
 :subject:content-transfer-encoding;
 bh=hOy2Z7jVZm1lWw36E0/Ru7n/upnPx77EpvsbOieTQZU=;
 b=O6NIp9fH1r+V9C772ESj4LITfSqrOh5h0oxjyMFLUWHhAKWtI5uxsbn05Pm4X0Kf2O
 2J2Y4NC6KTs+urXzOMLbWLXwsqNnYCuccvBR+6/UZTvphSsK+D93QblFe7R/eplMHE8M
 5IXHjAwvJwc3TSSx9bmBjgU6GBFxkvKaqUOpsmxMKnt7lFLH6yOrTfygHhvYyBPBzAof
 gnuU+wQOuT3aiq3mSdWZ/UCWDxH+zFqv8+HfFk84oGKRMl7/i1jwKa2vCnG0foLgscI0
 y1N1BxbJZMr0EmecLgj8yuVbCIdtsBPXaNTbdJvhhUaFmF0XUgMb6P74Yk7Zh6WY2qb+
 t6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:to:cc:subject:content-transfer-encoding;
 bh=hOy2Z7jVZm1lWw36E0/Ru7n/upnPx77EpvsbOieTQZU=;
 b=iVBvb2MlbQ5gItDxDBEKHfgJX1upKYunBGN1CqtGuegQf3b5wrYIlH8sP9B7Guyp5c
 7z0GOJkOKhdnut10yei6kVqrlTtEE8Oj/vluK+0M/XK6Wiersc7G2OlEjEslkm17vgbL
 p/q1792gXX1DORFvnCNqBy3M9IRPiDJyGy261VOqEb6WB+ZXIwzIFoiuaNCzhOJ0BcOc
 ONsH8bmX9OIGYpPA46Fa4Upc9Oe1UJbzODS1r7xyGyCBOKhh9b3CBo10FywKMhqnEOUx
 D/1RuOK+x5ovArsQUQfky7MOUN2wZ+W0HWCZcTWhCNKq52wOALoZlsRjCAEmDM85OWTo
 PH4g==
X-Gm-Message-State: AOAM533OBtp8ldOPvk7mfNNjFKBkJoDSR7MDl88cpz/AMk7/SqD/rryM
 +FSzbpu7ObQHeCpQzU8gt+Q1KZMN680=
X-Google-Smtp-Source: ABdhPJzV/fv6XNU40qclMyvvTYm8NSjde3HQk7t3iYb+I4MCNyd0TdT9+BQsY0OO2PgDEnDaVFbcMg==
X-Received: by 2002:a05:6808:905:b0:2ec:a76c:36a1 with SMTP id
 w5-20020a056808090500b002eca76c36a1mr6271224oih.188.1647525543751; 
 Thu, 17 Mar 2022 06:59:03 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:daa8:d948:1d15:1451:398f?
 ([2804:431:c7c6:daa8:d948:1d15:1451:398f])
 by smtp.gmail.com with ESMTPSA id
 p66-20020aca4245000000b002ee110f182fsm2458242oia.37.2022.03.17.06.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 06:59:03 -0700 (PDT)
Message-ID: <38c43d66-e57c-e0fe-d35f-c411d40d6611@gmail.com>
Date: Thu, 17 Mar 2022 10:58:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Question about vmstate_register(), dc->vmsd and instance_id
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I've been looking into converting some vmstate_register() calls to use dc->vmsd,
using as a base the docs in docs/devel/migration.rst. This doc mentions that we
can either register the vmsd by using vmstate_register() or we can use dc->vmsd
for qdev-based devices.

When trying to convert this vmstate() call for the qdev alternative (hw/ppc/spapr_drc.c,
drc_realize()) I found this:

     vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr_drc,
                      drc);

spapr_drc_index() is an unique identifier for these DRC devices and it's being used
as instance_id. It is not clear to me how we can keep using this same instance_id when
using the dc->vmsd alternative. By looking a bit into migration files I understood
that if dc->vmsd is being used the instance_id is always autogenerated. Is that correct?

Another related question is the role of instance_id per se. I understand that this
value is used to identify SaveStateEntries in migration/savevm.c and it's autogenerated
if the caller does not provide it. And there's also this comment from
register_savevm_live():

/* TODO: Individual devices generally have very little idea about the rest
    of the system, so instance_id should be removed/replaced.
    Meanwhile pass -1 as instance_id if you do not already have a clearly
    distinguishing id for all instances of your device class. */

Given that this is a 13 year old comment from Anthony Liguori I wanted to confirm its
validity. Is there a long term goal of getting rid of instance_id? Can I ignore its
role when converting these calls to dc->vmsd?


Thanks,


Daniel

