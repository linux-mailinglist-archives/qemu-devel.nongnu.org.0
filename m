Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0164237B4AE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 05:48:21 +0200 (CEST)
Received: from localhost ([::1]:38114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgfrA-0000qP-2v
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 23:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dja@axtens.net>) id 1lgfq9-0008Ro-8n
 for qemu-devel@nongnu.org; Tue, 11 May 2021 23:47:17 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dja@axtens.net>) id 1lgfq6-0003Px-20
 for qemu-devel@nongnu.org; Tue, 11 May 2021 23:47:17 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t193so4681676pgb.4
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 20:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=2U0VgpVpcP8AUVdyKbzT72PowAOq2WkmJbskwtudkNk=;
 b=Drwv/w9Lh+JHIYrDTQQIknMohoceLZnPCJmJ8Qwsbi+COMt9uX76qv4Y1IggFrP70q
 0lNAobscaOQnJpgvtxoOLWSv9CmRrLuiVSgurG4PNclAqlqkc5dx6kzJcDyhuBNNPFJQ
 nfGphrvYEHkxDEqaVvJbRrz5FsZEXB8+YjrH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=2U0VgpVpcP8AUVdyKbzT72PowAOq2WkmJbskwtudkNk=;
 b=tbwvK4BagnEkWiO7ifuKO/kQBNXiN0SzDNCORcn7QccrZFWLhMHeVi619zsKPL1vDr
 kHQgcnC4MQOnmjEsJPWeyzBcjPcgFo+ztegDyXGWOJF9gITC+3maNIRSXtTVJx1z0/eF
 rM61jH3jZ4Tl5AJcX92PnJCtEjK1PwDR+uCvIleCD9r94WABk5H3XZ3z7BT7W83Mazzk
 gmEXLXTap9N2UQO1VM/LpcKDyRchjtg2bWgwr1c22y1ZTmJ1IZ7DMKfyDWgXQFFAX2kE
 c/dDD0pcwxlAc3UBvi0dEHikl3QOuz2FjpA91MzAt9i3q3IJIxt6qNAE4JxBnEIXkvoS
 ho8g==
X-Gm-Message-State: AOAM532A/Zis07PSUf3ZmRsv6uhAo6/WjrbWbODazg+qRYJv+PUk+w+t
 oxR9YBNgQOUlBLyr1EW+7CWrvg==
X-Google-Smtp-Source: ABdhPJwEFY7DMVNEB3DJHvWLuwiAxVl9i7Uf8gdL7v4pJe4zQfgf0Lw50tmaw0+LiWIo5j81QvOOtw==
X-Received: by 2002:a63:7049:: with SMTP id a9mr35152465pgn.181.1620791232394; 
 Tue, 11 May 2021 20:47:12 -0700 (PDT)
Received: from localhost ([101.178.215.23])
 by smtp.gmail.com with ESMTPSA id w1sm14706193pgp.31.2021.05.11.20.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 20:47:12 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] ppc/spapr: advertise secure boot in the guest device tree
In-Reply-To: <YJoNJDaN2SlyuwZZ@yekko>
References: <20210510120713.90053-1-dja@axtens.net> <YJoNJDaN2SlyuwZZ@yekko>
Date: Wed, 12 May 2021 13:47:09 +1000
Message-ID: <874kf8zk8y.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=dja@axtens.net; helo=mail-pg1-x52a.google.com
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> So.. what's the point?  AFAIK we have no secure boot support in SLOF,
> so what would advertising it in the device tree accomplish?

Linux reads the property and enters secure boot mode:
commit 61f879d97ce4 ("powerpc/pseries: Detect secure and trusted boot state of the system.")

grub patches to read the property and enter lockdown are on the list:
https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00359.html
(patch 19)

I have very basic SLOF support:
>>  - github.com/daxtens/SLOF branch ibm,secure-boot (not production ready!)

The property is extremely useful in developing and testing secure boot
support all the way up the stack.

Kind regards,
Daniel

