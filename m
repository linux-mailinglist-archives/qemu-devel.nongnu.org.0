Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B003403C8D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:32:49 +0200 (CEST)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzZA-00086Q-CY
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNzXL-0006e7-Sk
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:30:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNzX8-0008C8-6C
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:30:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631115039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B3ppFM+u3u37rNDlk9b2WFw76Y+p+Srqgr1HO4M5sac=;
 b=jHINtPr441LYBWacWvciOyCHHZFzyQpToMAasujnCdnABMSLGVCaPmpjFiA/Mtcpsg7OOg
 yGzySz1lmPO+bCDlJeeu1kM/GYczcUzaw9J+BL7W7ar9A3P5I5N7NhRhqeVJa/fiR6B7Co
 T+PBr+43alaxcPYkKXFzfGyFLsF+DSc=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-OhjjHvZrOlKvPzlL399KtQ-1; Wed, 08 Sep 2021 11:30:37 -0400
X-MC-Unique: OhjjHvZrOlKvPzlL399KtQ-1
Received: by mail-il1-f199.google.com with SMTP id
 v9-20020a92c6c9000000b00226d10082a6so1871824ilm.23
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B3ppFM+u3u37rNDlk9b2WFw76Y+p+Srqgr1HO4M5sac=;
 b=K8ycg+NwHUdQMNtluP9tSeLWuATGj/TtkvXOmHy9Ef603MchqOddDKqN0qwQEGH2oH
 EDjgiKI+w/EHW3vCCaqGwIg6wxkmYd96PU9S6vhdauQlhjxCt17yQrng70qRpxmQm5oh
 k85X2yLO4Jz8HaReyzaAeAbnZawEoAEUNR8rxHFuwxuXKrE89Gg9pgaN+nG39pyh2lC5
 UrG7l1q5G8FW5NC5N+RLU9kB4PUFX7t8Fad5nLGUdvDyj+l/SvVsN0HWDlvaZonq4o6i
 rKZBv/KA2h9jlg3dWFOm0TAoDRYCCvKXtzQ+Wkdj/hoVP8icHMUn3HdrCESRWJgsCg8n
 A5kw==
X-Gm-Message-State: AOAM533FnSfcb8tQYbHyzsb/0U5DmNoODTEA85P+KM1FjG+f1l8+a2Xh
 M2IXCO19KafonCieH+GAbyc/C4GW2EcVrIQo/YJVo0CruKJZjWrganQq2MGx2JlvxBrh5jwgbhJ
 CD3gCmmxS//W1LLX2KswCljEi/xx+p7mPSSTrGP520H9CU3KDb2k//RbrpuZyTLWh
X-Received: by 2002:a5e:9819:: with SMTP id s25mr369922ioj.63.1631115036750;
 Wed, 08 Sep 2021 08:30:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqzXR63lEwNxs6SBhajzxJC4jJbFYQQ3x42DG24qek4c75SvokIqi3NnqTNKCIqlmc8BSFtg==
X-Received: by 2002:a5e:9819:: with SMTP id s25mr369894ioj.63.1631115036396;
 Wed, 08 Sep 2021 08:30:36 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id y27sm1293531iot.10.2021.09.08.08.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 08:30:35 -0700 (PDT)
Date: Wed, 8 Sep 2021 11:30:33 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/8] memory: Sanity checks memory transaction when
 releasing BQL
Message-ID: <YTjXGQYCK4fLDp8B@t490s>
References: <20210728183151.195139-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210728183151.195139-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 02:31:43PM -0400, Peter Xu wrote:
> This is v3 of the series. And, I think this is 6.2 material.

Ping - just remembered this one too..

-- 
Peter Xu


