Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89B964A5EB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 18:32:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4meK-0000cW-Fa; Mon, 12 Dec 2022 12:31:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4meI-0000c8-8Z
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:31:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4meG-0005Rq-PV
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670866288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42hm0tIAGXaE7XKjkXZdflFmxg7Trs9UGA5GR2ReUlo=;
 b=FIpGOTo6JHU15GsO5JAE/zqrwI50oXNgtY5+MZwtD1PmcFo30PjVwKZM7lMcr3d8UM1O1u
 kAEGjxoHyJq1ojEyL/goVignbIhb3GfwBhInqWL3xDZ4w7LHy9Pcm234pCdb34b8Hf7lKX
 +BDt556bkRBfDHufGAo+HsDBtBsSjlM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-199-wxrvvCzLNE6De22CZGmp8A-1; Mon, 12 Dec 2022 12:31:16 -0500
X-MC-Unique: wxrvvCzLNE6De22CZGmp8A-1
Received: by mail-wm1-f71.google.com with SMTP id
 r129-20020a1c4487000000b003d153a83d27so3682461wma.0
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 09:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=42hm0tIAGXaE7XKjkXZdflFmxg7Trs9UGA5GR2ReUlo=;
 b=7EwBYieJYoqSVpPGo5g8AGQujJKUHFJ9x0SVWoYPBXhtoUmORc/Gv0xnD7ahJ142Ms
 nXJT79gvDpCMD+n9e3c23vpfyRwNZ+Q7R+Lwr9qjWUBz6Xit6sMYyaSJZFMYiqNaWvwR
 ziTBZ+Wf1dpWV/glXLg1OFuTzdDYrWIxqj1mOhVD6B0UleFsRy2KVj231Vch8QyvPuYO
 AdyDUNiBDk/SCT3seThC+kCYtjtEktlfcLXqnZ2r/0Lp3yDXRYB+x8StqUa+B+pHC4Fo
 /LLQa9/QFrxpl5S8K1LKqiVaCyacTSMl3AvZX96CqArvTIrVm3gH7nHRh5Bs1RN4RGtm
 88SQ==
X-Gm-Message-State: ANoB5pkvCrdFpoOCiHAkc7ixmu5fLfNI8wwi4f0NnuBhXbDo01hkbG6j
 U6TzGLF7edfwx3VG6YBLg5tWlYfxcDt5gY7nJtDAlevoaIutuecxIVLUqDkvnfYJrRT9vGT1mck
 Nnj52LcUqchBycmw=
X-Received: by 2002:adf:f1c5:0:b0:242:1f46:fb8c with SMTP id
 z5-20020adff1c5000000b002421f46fb8cmr10706965wro.41.1670866275708; 
 Mon, 12 Dec 2022 09:31:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4p6lVyy+Swa6wLjo7tAtkYOTG+6mTyKMPMmIeqmJuUqNlqPzmtAEcB3wGxeu7FbKNpdw5ZVQ==
X-Received: by 2002:adf:f1c5:0:b0:242:1f46:fb8c with SMTP id
 z5-20020adff1c5000000b002421f46fb8cmr10706953wro.41.1670866275536; 
 Mon, 12 Dec 2022 09:31:15 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 p7-20020adff207000000b002425dc49024sm9424573wro.43.2022.12.12.09.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 09:31:15 -0800 (PST)
Message-ID: <77fe1c70-16f9-d872-f1b7-5c31c8d06534@redhat.com>
Date: Mon, 12 Dec 2022 18:31:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 14/15] block: Don't poll in bdrv_replace_child_noperm()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
References: <20221118174110.55183-1-kwolf@redhat.com>
 <20221118174110.55183-15-kwolf@redhat.com>
 <30eec378-779a-26ca-42f3-a7980a647ad7@redhat.com>
 <Y5dPU7CDisZwKYy5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y5dPU7CDisZwKYy5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/12/22 16:57, Kevin Wolf wrote:
> I looks to me like this is a problem with the test case rather than the
> change per se. It seems to be fixed with this patch that is already
> posted as part of the next series:
> 
> [PATCH 09/18] test-bdrv-drain: Fix incorrrect drain assumptions
> https://lists.gnu.org/archive/html/qemu-block/2022-12/msg00165.html

Cool, thanks.  I'll retest once the series hits block-next.  In the 
meanwhile you can ignore the first three patches of 
http://patchew.org/QEMU/20221212125920.248567-1-pbonzini@redhat.com.

Paolo


