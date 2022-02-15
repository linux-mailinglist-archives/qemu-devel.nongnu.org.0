Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BB94B646A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 08:33:11 +0100 (CET)
Received: from localhost ([::1]:58468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJsKk-0001l6-KB
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 02:33:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJsHS-0000Qz-Bc
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:29:46 -0500
Received: from [2607:f8b0:4864:20::42d] (port=40565
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJsHQ-0005jQ-DW
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:29:46 -0500
Received: by mail-pf1-x42d.google.com with SMTP id c4so12137516pfl.7
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 23:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=aJ9WKtAz4dKJQ3l8NFNPmHc+PFvzfkPEaRofuGZ9BIA=;
 b=3npCqoxYWC4KM2k6K5gWmc0IcPbUArwF7ZKdDS0yKqkWYYNY+EI0PaPR0+t3AjiQpu
 csOnLGfxCuenzLnTtW+fee4F7exndkIDOGQU79RirkkAO1tv1zbZC/liFXcvJiUsz+Ao
 +YcRggqn0Y++uptf+vDzcDoDOUI/G+paG2Ucr7wCxgOqPZANzS/b7MJDeN/mXh3tj1WV
 D2ic4maVp7MrRTIK0pDJ/GU9RDbJdXhYXa+hlEfp1mmbG4MqGu/g8mPOmDUpLK+g5SEK
 rjhnM5xQJXfe7rWfjwCvSEH5OstOarga7mVKDQnDNkgmvuHLMj5LIb6q+nMP/N1q4yiL
 zRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=aJ9WKtAz4dKJQ3l8NFNPmHc+PFvzfkPEaRofuGZ9BIA=;
 b=KLG0knqN403k35nJe+UZUgN+F7QiM8iS+iiUgXTERMG8gh2DZda00zsFdMqQAaJ7Nx
 BKMEJk1Ldcj6K56gSE8BFSxy5SetWWGtCDexr85oq9dqfeN3oFzXhxgyJ66coY19AwhO
 x68/n3MuuxzqPGd8cQl5d3lZUd6bY+OwlUWH4BTR0XrlTI0thQ+SsdIRB4zooeICkPNR
 l5yTdaR0uAPZ6ryWFJgv0KKswYcspvSQDf1nrTrBvUkGKmtu82C55DL+f1id7l1ORyL8
 3z46GvbGDK3jk34JLq/FBDDgTkhvujD2t+xlMCCX1jyBnsJwCQYz40IX0w7OuLaIBKxd
 CaTA==
X-Gm-Message-State: AOAM531GVNfvU1vPiaJV7jGB5nshPHBMKduiHouhIjIk5eOLyQTqF8VC
 VMbOhNKvJ1sqirkpuUZ2Ryxlcg==
X-Google-Smtp-Source: ABdhPJyrPEM/ewo+q6XqmI2GGJxVwvImlqQNEJbb+pco3FVAxDg7JMC1c2Wd3V20EwLbfRcY9kWCwg==
X-Received: by 2002:a05:6a00:a8e:: with SMTP id
 b14mr3073882pfl.24.1644910182743; 
 Mon, 14 Feb 2022 23:29:42 -0800 (PST)
Received: from anisinha-lenovo ([115.96.134.54])
 by smtp.googlemail.com with ESMTPSA id s9sm4867775pjk.1.2022.02.14.23.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 23:29:42 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 15 Feb 2022 12:59:33 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: 9 TiB vm memory creation
In-Reply-To: <alpine.DEB.2.22.394.2202151221090.13781@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2202151256340.13781@anisinha-lenovo>
References: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
 <20220214133634.248d7de0@redhat.com>
 <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
 <alpine.DEB.2.22.394.2202151221090.13781@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> > > With KVM enabled it bails out with:
> > >    qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument
> > >
>
> I have seen this in my system but not always. Maybe I should have dug
> deeper as to why i do see this all the time.

Actually this would happen only wnen I was playing with memory larger than
8 TiB. So it makes sense.

I ran my script again and I can repro it right away:

2022-02-15T07:25:34.051320Z qemu-system-x86_64:
kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1,
start=0x100000000, size=0x8ff40000000: Invalid argument
kvm_set_phys_mem: error registering slot: Invalid argument

The other thing I had to do was

# echo 1 > /proc/sys/vm/overcommit_memory

otherwise the firse mmap() in mmap_activate() fails.

