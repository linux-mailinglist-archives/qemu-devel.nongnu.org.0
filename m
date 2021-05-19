Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458EF38836C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 02:06:20 +0200 (CEST)
Received: from localhost ([::1]:44696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj9j9-00058W-4j
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 20:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lj9gh-0002sZ-14
 for qemu-devel@nongnu.org; Tue, 18 May 2021 20:03:47 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:33615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lj9gf-0000Na-IR
 for qemu-devel@nongnu.org; Tue, 18 May 2021 20:03:46 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so10272958oto.0
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 17:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KRxo9FaKHw6JS13B9wmpr/RfMV3kOTIPyVap6xmsLXY=;
 b=B/5HHtUa+bf1Oy3exyIxH+AsnoPPImgsmuAfIh7Vu9hmS5i+DMCOY0xp9XfCFeUIo1
 SlyBFcn7ytwb68fWldk3EDUMBJ8fUTmGv3gaHhDZSynbUh+X06Sp6JUHrF7YEC93r0m0
 N7d1+3wC4+1ij87nAO1Go5XQve67ZLsBFQ+2MMXYKF2chy5xJo/Q5PyPBxmFOu8cOyeX
 kSkiuPoIIvXYFaJwF6KjaOtPbtVRNRwcBuMqpV5tHUsGUgm3zNw+MLS+BtKWZaqt6POp
 gfNAzioKjpBVbmCZ4A3C6VCy8SgCxwaGSIOKp6IArpxUyLCW+yGn/6gr8jAyaWLzm9J2
 Kkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KRxo9FaKHw6JS13B9wmpr/RfMV3kOTIPyVap6xmsLXY=;
 b=FvmD/7j6kzr2a1EFHAxZjLS+PAuFEGxfGZzLjW3zz3iXI3GIXc2tF9c+MxXO7Uxnc4
 J+GMp/22Sev2+hZW5TB1iQ9ZYOydqq/xdc63EKKKG01LIWi4AoMpTFP+2mUyrVwKEpW6
 Brq6/gVK/PoVuGCnG4W4quZd/zgel6iMRnIeFQ3FbdNLPBgnF/miMD8Mnf1bNnkiBXYs
 MjWM6EFARj+nh2P6GoormUK/SV+MKZK9w+mf/sdAh/OjPTqpiToktB1jiOpOhtzEa7V2
 WjpsdElxvpJvz0LnVTldk5T4mHR+pwMRApgSPEa2tzlR6VSmHjuXXjG+MwerxiUS3i8d
 EyDw==
X-Gm-Message-State: AOAM531lZmeycalHILHYuv6FUdAdCQP6ssgp4O7bkDHEzK07eCOeoa56
 hJeDda8w8fsGaN2L8eXUPQ==
X-Google-Smtp-Source: ABdhPJyOrlxCPALDQxHEfFi96jQjOQDrDMEhpanZFOM3eM8ewEldZdh7stAlKiSC4dGakIcrIm1b6A==
X-Received: by 2002:a9d:7a54:: with SMTP id z20mr6238778otm.17.1621382623721; 
 Tue, 18 May 2021 17:03:43 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id z6sm3829188oiz.39.2021.05.18.17.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 17:03:42 -0700 (PDT)
Received: from t560.minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:9144:ba66:ea13:f260])
 by serve.minyard.net (Postfix) with ESMTPA id F41F6180003;
 Wed, 19 May 2021 00:03:41 +0000 (UTC)
From: minyard@acm.org
To: qemu-devel@nongnu.org,
	Titus Rwantare <titusr@google.com>
Subject: [PATCH 0/3] Move some things out of hw/misc
Date: Tue, 18 May 2021 19:03:28 -0500
Message-Id: <20210519000331.3690536-1-minyard@acm.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hw/misc has collected a few things that could be moved elsewhere.

Move two ADC devices into the adc directory.

Create a sensor directory and move the sensors into it.  There's only a
few for now, but the people driving the BMC work are going to be adding
many more, and it would really clutter up hw/misc.  This is the main
reason for the patch set.

I was unable to run the tests to completion, but I think I ran the ones
that matter.  The end of master fails the BIOS tests for i386, at least,
and it hangs the test run.  I backed out these changes and
double-checked.

-corey



