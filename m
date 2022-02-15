Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137614B640F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 08:13:54 +0100 (CET)
Received: from localhost ([::1]:53616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJs25-0005pw-0V
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 02:13:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJrzX-00053N-PR
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:11:16 -0500
Received: from [2607:f8b0:4864:20::42b] (port=35558
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJrzW-0003ZI-35
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:11:15 -0500
Received: by mail-pf1-x42b.google.com with SMTP id l19so27595997pfu.2
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 23:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=tUjN+MwfPXKyekJyLdLOuh9XbMeX1gHW6QfO4xOx6IQ=;
 b=e7qMPHAMUCER2XWdYT/ZCuxpco78MI6tSxllOph7aEi/OnRscmrTZvoobb94yKjP6J
 i8QSSNkyyaQ4gDf/WDAsefjIfVbfF7F4mKukem7KiLbKY4DaO317xt8t7zVO6yOdWZeB
 A751O6UQKCAO5CrZwrYcqvWXxxohPqqb+KuTPMrzgpa3vsK0dOvvvO1AFpS8e9XR2IS9
 69iqla7ZZArOqHxmEdi8lGUJIM9op1gl9ZIXrp7/Eh7FmlT+00zkZ1b05oRjqMBjy1+R
 0B30FQdOSjOjbsBgfYPkHye5sh+qdtMS1tH1VhOBjeh5KOouVusC5aslSD4YSHuXXDMY
 72yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=tUjN+MwfPXKyekJyLdLOuh9XbMeX1gHW6QfO4xOx6IQ=;
 b=1pJcCqkT7wR9Idwjv6v4wg0QAD8BUwWj1tRXryPEGXTuynAasQO0cn4pZIb31Cnm7G
 6Uw4E3nkV7Khf3y6+5OHow1KeUORjMHRjSB++ul+IEV1Ie8VM3wG9/fAsOzMOHPt1nCH
 wkAZjOKhhjFJndaIm2rPkUiHH3c5nP8gvL+BCzogtcVm6nU2VsTWmdqPMPgW1w04gFzk
 NmQixL9+5/0FlwTV1Tsm/MY0z5NC+qWkKlynfEeJinjI9RwtkjQMeF55UoH/8NTblUIC
 GHFZ1VehlPySVDP8MdnCLgcgbe4kz3kaDs34jqFC4nulVDjr8MQqhLNMxoxBXfLAahmO
 65cA==
X-Gm-Message-State: AOAM532KrNvxM3X3enlyj49MNzqohn6nnNZuo4bs95nAuLnJDordLeK8
 o7PaJVU6jOEa52nkNf6ovej/QA==
X-Google-Smtp-Source: ABdhPJyrEzRwIreXS++rrLi8gclNGXl4L8CgwQqB+9dafwg6jrwtoxUr8w+KXKI5z3Y/l3RfrPX5gw==
X-Received: by 2002:a63:4422:: with SMTP id r34mr2390430pga.275.1644909071544; 
 Mon, 14 Feb 2022 23:11:11 -0800 (PST)
Received: from anisinha-lenovo ([115.96.197.51])
 by smtp.googlemail.com with ESMTPSA id y10sm4087346pjc.0.2022.02.14.23.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 23:11:11 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 15 Feb 2022 12:41:06 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: 9 TiB vm memory creation
In-Reply-To: <alpine.DEB.2.22.394.2202151221090.13781@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2202151240250.13781@anisinha-lenovo>
References: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
 <20220214133634.248d7de0@redhat.com>
 <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
 <alpine.DEB.2.22.394.2202151221090.13781@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42b.google.com
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




> > static hwaddr kvm_max_slot_size = ~0;
> >
> > And only s390x sets
> >
> > kvm_set_max_memslot_size(KVM_SLOT_MAX_BYTES);
> >
> > with
> >
> > #define KVM_SLOT_MAX_BYTES (4UL * TiB)
> >
>
>
> So seems in Igor's system its getting limited by kvm not qemu.

oops sorry, I read through the thread. we are all saying the same thing.

