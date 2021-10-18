Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49DB4313DC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:55:03 +0200 (CEST)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPME-00059D-WD
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcPKI-0003Md-RW
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:53:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcPKB-00046A-K1
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634550774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sVwFB04qw3BBHOZxTd4gr8hG2gL5uE4L2RcFcff5B6w=;
 b=FQResLcoMuAp6h0nSdRaOqBhty2tMqR0A/xOB14DuEZ+wYc3pYApxP/cQSIOCZFgBUOjDD
 daTxZjrY7Qu9Rr4rEjQoKYA31zDVdXm0CNKon6o8n2pkBjAznVqZGu206xEp+X3qDPO4bL
 0fp4AbVuoyK51NCGZDIxGjGXk4EoQjw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-k_QXVczzM16wr2uKHHWHjA-1; Mon, 18 Oct 2021 05:52:53 -0400
X-MC-Unique: k_QXVczzM16wr2uKHHWHjA-1
Received: by mail-wr1-f70.google.com with SMTP id
 41-20020adf802c000000b00161123698e0so8609418wrk.12
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sVwFB04qw3BBHOZxTd4gr8hG2gL5uE4L2RcFcff5B6w=;
 b=PAfS+k4tkoLyyf/GmvtB2/sG9SrDkeBFOsH+FYiVLWbiG7BfenVKkepExPq4+uOFWr
 wiaGxPGkplD2ygEATr3Lz7aYhhz/w76yal4BSO6TLytc/wYDUmx5wLtE38k8xQHCoiaj
 zaEQdBQJiW2lrkJ3XfdquHEbWdQFK/1O0X7x6qg8hJtkNmUmM+XVnsXMXp7EvHPVvo45
 3FV0BW5wjnzD3dg5Kt/3UBs19nkwis/1PPY0ygytxrT0G0iepT4pOmwtuXJ7hR79yioG
 66fMfh6TqSBfZHiXGqounzzN567Zy/izEKyKDmT2ejMJp5CZ1ZxIuMcCGIR/MQFXseq3
 PsJg==
X-Gm-Message-State: AOAM533pXeHMYMatjwSjT1QG8nf6MCj0wI1YLahXuifbVwUNO30AOReu
 dSepHwA5ImnFKyyqT2vo1TWnUaEgwGg5al1OBiOlthvLRvkkohHv+poUX1O6ia4NX476i9F+Qxc
 x5QTswWYXe7vYE5A=
X-Received: by 2002:adf:ecc9:: with SMTP id s9mr35308121wro.434.1634550772352; 
 Mon, 18 Oct 2021 02:52:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0yfCOOUvmZ6gnfGGGQMz5zb1LoTSaAQSBkum6JeEWsF9EGGbaTxUHYm/HSg2Y+DCprjTyGA==
X-Received: by 2002:adf:ecc9:: with SMTP id s9mr35308094wro.434.1634550772122; 
 Mon, 18 Oct 2021 02:52:52 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id o26sm17753613wmc.17.2021.10.18.02.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:52:51 -0700 (PDT)
Message-ID: <0d2def93-0318-ad49-3002-083253ec9723@redhat.com>
Date: Mon, 18 Oct 2021 11:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 11/15] hw/nvme: Calculate BAR atributes in a function
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-devel@nongnu.org
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-12-lukasz.maniak@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211007162406.1920374-12-lukasz.maniak@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?UTF-8?Q?=c5=81ukasz_Gieryk?= <lukasz.gieryk@linux.intel.com>,
 qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Łukasz,

On 10/7/21 18:24, Lukasz Maniak wrote:
> From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> 
> An Nvme device with SR-IOV capability calculates the BAR size
> differently for PF and VF, so it makes sense to extract the common code
> to a separate function.
> 
> Also: it seems the n->reg_size parameter unnecessarily splits the BAR
> size calculation in two phases; removed to simplify the code.

Preferably split in 2 patches, simplification in first, new function
in second.
> Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> ---
>  hw/nvme/ctrl.c | 52 +++++++++++++++++++++++++++++++++-----------------
>  hw/nvme/nvme.h |  1 -
>  2 files changed, 35 insertions(+), 18 deletions(-)


