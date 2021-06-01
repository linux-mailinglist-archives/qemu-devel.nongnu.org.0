Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B0C397813
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:29:49 +0200 (CEST)
Received: from localhost ([::1]:44276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7H2-0004G8-Lq
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lo7Fy-0003IH-VA
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:28:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lo7Fx-0003O6-EZ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622564920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qw20x2fjwedhuZ1OEmopFQrUY0+6+w1b0jp/tJqXH90=;
 b=ToL+DMFxRX6uxxSkVI75i4uquR4dnwkNxRB8Cx+cGHuUSq4OzFlDFxmVCZfyD+/TBMWy1V
 9uFeX9T05bJpdTR2J4kL32jeD5wviOhZyl/F7GkQ8sZ6XjJzpgsILfDlKGA9EQbr8/dEFo
 ZJQ4Tdj7Zj+PXL0yOnst58aYanplods=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-hdXZvf9KNnmhmf42X2TRsQ-1; Tue, 01 Jun 2021 12:28:39 -0400
X-MC-Unique: hdXZvf9KNnmhmf42X2TRsQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 eb10-20020a170907280ab02903d65bd14481so3529669ejc.21
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 09:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qw20x2fjwedhuZ1OEmopFQrUY0+6+w1b0jp/tJqXH90=;
 b=FWWtiRYUlpJPdsG+b5RxXgSnHWkuO/TCIF/d9o98EBFl2Htd/xcYxAdrYFR0Aqy01N
 xYKSN2BsOLlHDWtt+qb9EuHomHA9z7XHZnXFKMmIvtVHTvdvQX9wMm512V51on2PrgnV
 HfZxWAmX9hAm+Yuo887oyZhvVM62tS+mxrmXJfq/2QX3HNunJxiuavOsn74dodXw4p83
 /7utyjTxR4yXQ9+SszhGN9zcK09Xn43hbsIyprnbK3T9msi0wsPUnwTOED+7nJ1fF4bn
 BDhAlLRRb0z7goBLdaj/TwOgyzJaKMNaLMHX9sybZcrDChaZ0wOZmYGFeJgGk2i4LM/K
 cfSA==
X-Gm-Message-State: AOAM531XmA49JmoNqxMf2SB7aUdQgJJ/XVYhrBOecbihJQgzVD4PExGq
 qNN2TCA8va5kza/2iTR0Xrgg0q83gCZwQAfmBhCEYeVky8y+QM82B1UAaEC9sV/vi2G5P+Q7xC+
 cxO45CQKy/pFo/Qo=
X-Received: by 2002:a17:906:ecbc:: with SMTP id
 qh28mr534723ejb.406.1622564918042; 
 Tue, 01 Jun 2021 09:28:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJEhtJS08FZKYAd2qiQv0T8m4L2AOOyHdBtBmpSnzRbCJQcLn/0oo37K6TWH0mehF0UDTbvQ==
X-Received: by 2002:a17:906:ecbc:: with SMTP id
 qh28mr534708ejb.406.1622564917906; 
 Tue, 01 Jun 2021 09:28:37 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id h9sm8692485ede.93.2021.06.01.09.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 09:28:37 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] ui/vdagent: fix clipboard info memory leak in
 error path
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210601155755.216949-1-stefanha@redhat.com>
 <20210601155755.216949-3-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <16d7c6fe-6ea1-71d1-2242-5c11ce9a00e7@redhat.com>
Date: Tue, 1 Jun 2021 18:28:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601155755.216949-3-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 5:57 PM, Stefan Hajnoczi wrote:
> If the size of a VD_AGENT_CLIPBOARD_GRAB message is invalid we leak info
> when returning early.
> 
> Thanks to Coverity for spotting this:
> 
> *** CID 1453266:  Resource leaks  (RESOURCE_LEAK)
> /qemu/ui/vdagent.c: 465 in vdagent_chr_recv_clipboard()
> 459             info = qemu_clipboard_info_new(&vd->cbpeer, s);
> 460             if (size > sizeof(uint32_t) * 10) {
> 461                 /*
> 462                  * spice has 6 types as of 2021. Limiting to 10 entries
> 463                  * so we we have some wiggle room.
> 464                  */
>>>>     CID 1453266:  Resource leaks  (RESOURCE_LEAK)
>>>>     Variable "info" going out of scope leaks the storage it points to.
> 465                 return;
> 466             }
> 467             while (size >= sizeof(uint32_t)) {
> 468                 trace_vdagent_cb_grab_type(GET_NAME(type_name, *(uint32_t *)data));
> 469                 switch (*(uint32_t *)data) {
> 470                 case VD_AGENT_CLIPBOARD_UTF8_TEXT:
> 
> Fixes: f0349f4d8947ad32d0fa4678cbf5dbb356fcbda1 ("ui/vdagent: add clipboard support")
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  ui/vdagent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


