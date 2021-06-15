Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9573A79AC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 10:58:31 +0200 (CEST)
Received: from localhost ([::1]:54086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt4ty-0002lY-TU
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 04:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt4sM-0001iS-V0
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:56:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt4sL-0000yA-34
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623747404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjYRtHCLwilP8mM4y+qRMfayYRV2WeZwLZenqhkPldo=;
 b=Bq2gfU2XAGtcTS44fo7iCgqsj0X8ge1diPKmfnoj8keieK2Z1UhQLBTDv+61XOAb6tSz9H
 9LyFmfTdAPYrcxY26DYTAlr+RgTgFLDsyrkrZhxbcQyMj7m1rV6XiD/2iyfv5Ps1aLjieN
 5TZQwAY+3vXs+eXInwCy+lZ//RIIflM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-CSRbGd_SPmGnIvPAIOlJNQ-1; Tue, 15 Jun 2021 04:56:43 -0400
X-MC-Unique: CSRbGd_SPmGnIvPAIOlJNQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 l2-20020adfe5820000b029011a64161d6aso387374wrm.6
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 01:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yjYRtHCLwilP8mM4y+qRMfayYRV2WeZwLZenqhkPldo=;
 b=rQ/MHfsbzCwYW1CS6WSljgdaXNPAHpeRLa52pod5K455a1mYpXXTGaw+rqPEAvhSxF
 yngPRalsjwCKcHZituzMdHxkUU/X4Las0PevV8fFSivoZxSSH1ccORY2IkugV3c55+na
 3e+09USaZrIDPMKD029Gv5cW3pjNsKZJsTco0KjqA+RxYVQ2qLKJ8IeWr603NlBGEGkH
 r+bvTmdu1Mr77uwfEMsmAp6TU5O8/WiHg+SG/oJL84czERr9rK6GpzuAZAGZvL+rYujU
 Glxk2TiIiuKA8PPKgeBGp/GEEUssrXhUlyxr/ykQYOtwbRX626ddOFPO6IfEhr39EStG
 YuGA==
X-Gm-Message-State: AOAM530/OqiA2tL2B/SylV8SqufNd5C1rvLARMaVYlGRQeo+QEaMvT9d
 9NZw3YLF83APpSAT7SKTaDDFBwKefFcldqp/P+pIMf+3PSexIi8ee9bA00JFfT3V0eXId9po9JD
 whoHilCcDsL5l4FU=
X-Received: by 2002:a05:6000:178e:: with SMTP id
 e14mr2987925wrg.246.1623747402380; 
 Tue, 15 Jun 2021 01:56:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx895UxES6Vr5Kt3AtwZUtasXmEYWE9nHXMC5s8bNbQz3Jz9sY4V+lGWrRcivK70nbLQWsXvQ==
X-Received: by 2002:a05:6000:178e:: with SMTP id
 e14mr2987885wrg.246.1623747402185; 
 Tue, 15 Jun 2021 01:56:42 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831d2.dip0.t-ipconnect.de.
 [217.232.49.210])
 by smtp.gmail.com with ESMTPSA id l31sm14967916wms.31.2021.06.15.01.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 01:56:41 -0700 (PDT)
To: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC] GitLab issue tracker labeling process: arch/target, os, and
 accel labels
Message-ID: <50c71eb7-02ba-a7a9-9ed3-a1908cc832e7@redhat.com>
Date: Tue, 15 Jun 2021 10:56:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/06/2021 19.32, John Snow wrote:
[...]
> RTH raises the issue of the "TCI" subsystem of TCG, which is not a full 
> accelerator in its own right, but (I think) a special case of TCG. If I keep 
> the 1:1 mapping to ACCEL_CLASS_NAME, "accel: TCI" is inappropriate.
> 
> Some suggestions:
> - "TCI" by itself, simple enough.
> - "TCG-TCI" or "TCG: TCI" or "TCG/TCI" or similar, so that it shows up in 
> label search when you search for 'tcg'.
> - "accel: TCG:TCI". Similar to above but uses the "accel:" prefix too.

I wonder whether we need a label for TCI at all... I can't recall having 
ever seen a bug ticket filed for TCI. It's quite a special use-case with 
some few users only, so it's maybe not worth the effort to create a separate 
label for this... just my 0.02 €.

> We probably want to keep a set of labels that apply to the host 
> architecture. These are useful for build failures, environment setup issues, 
> or just documenting the exact environment on which an issue was observed.
> 
> We won't likely require the full set of targets to be duplicated for this 
> purpose: possibly just the most common ones. I assume those are:
> 
> arm, i386, ppc, s390x
> 
> How should we tag those? "host-arch: XXX"?

"host-arch" sounds fine to me. I think you can limit the selection here to 
the list of TCG backends that we support:

  arm, i386, mips, ppc, riscv, s390x, sparc

... and maybe tci here (i.e. "host-arch: tci")?

  Thomas


