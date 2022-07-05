Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F6566562
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:48:22 +0200 (CEST)
Received: from localhost ([::1]:42408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8eEH-0001KK-To
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8eBK-00081i-GF
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:45:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8eBH-0006CC-N6
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657010714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2aG5G7s8oK7KtoPu2LP96q6f10ikwchbZ5p+n9UenIg=;
 b=MjQ3TCUVPRD00n3wkigntrxl9nwXErdaVyCS3x8xOsdOYaft7E+V8FMML9n/l8nD616cqb
 vdRNuGyAlF7ooIgYQjK2lw69nutlO08uiH5nHTwDOaqQa/eopDT+O0q+Ay/ODWeKLq9i4d
 C4O+MFndzw6YbgUqffP8VrOSllTKYpg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-9C9VF7SjOu2-xU8oallEmA-1; Tue, 05 Jul 2022 04:45:13 -0400
X-MC-Unique: 9C9VF7SjOu2-xU8oallEmA-1
Received: by mail-ej1-f71.google.com with SMTP id
 qa41-20020a17090786a900b00722f313a60eso2478657ejc.13
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2aG5G7s8oK7KtoPu2LP96q6f10ikwchbZ5p+n9UenIg=;
 b=4m7hjrbSUPJNdGmIy1KSgsbdLQoREvn+HXZFzp2TijCmsyVWh9Z4OBZgBz5mr1/MNM
 fb+VEHbeJ/i4pZ2RmUqZL3SkEVCUdAs0nrOFdnw/B5cKlWkUCyQ1k0yoOJHBfsWw3fIz
 vUHLeU0VJPGz0sloTmoKn6EHkrP43RK5PJys4rtN8PlFJRrHOpOZxb8npMiVgbvPBCPL
 cIsU6rZA3qA9pZHpPUTz4Jn0xhVVdwHwuBMakSXrL2zKtJnXg5ZBonIRlc/z0VBf4bOR
 yHrzuvBmH683jCV8bg40s2WV89rcyai/ui8unHNOVfrj852CnzIRpTdh9FiVqnV3ixQA
 yA7w==
X-Gm-Message-State: AJIora8Raz1E77QLSStjdL4Cfq1G+oPgEcCwGeD0R9LV5aTk2JxuiPnS
 qyNXyEjnGv7o5AvxDaW03ki6m9AmKykLJa93Z/Ac1Udw+O3r4mxPZ7C6em2m8nXZs5PU+IrhPBZ
 bcVwDSE0mtlRlWL8=
X-Received: by 2002:a17:907:7daa:b0:711:d911:2691 with SMTP id
 oz42-20020a1709077daa00b00711d9112691mr32843811ejc.626.1657010712587; 
 Tue, 05 Jul 2022 01:45:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sTsD/ml3ARUd5SzHxc7FQb0rRl3CbYyQ+hFFftCI3kbdHjf//C4f+R7E4HenkB+HrOrBw2BA==
X-Received: by 2002:a17:907:7daa:b0:711:d911:2691 with SMTP id
 oz42-20020a1709077daa00b00711d9112691mr32843792ejc.626.1657010712402; 
 Tue, 05 Jul 2022 01:45:12 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 dx13-20020a170906a84d00b0070f7d1c5a18sm15445349ejb.55.2022.07.05.01.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:45:11 -0700 (PDT)
Message-ID: <3c0030b3-ab33-b2b7-ed8e-ced7f55f08fb@redhat.com>
Date: Tue, 5 Jul 2022 10:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 11/18] block: Add blk_co_pwrite_compressed()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-7-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113837.199696-7-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 17.05.22 13:38, Alberto Faria wrote:
> Also convert blk_pwrite_compressed() into a generated_co_wrapper.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             |  8 ++++----
>   include/sysemu/block-backend-io.h |  7 +++++--
>   tests/unit/test-block-iothread.c  | 18 ++++++++++++++++++
>   3 files changed, 27 insertions(+), 6 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


