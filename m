Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197024024B1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:48:42 +0200 (CEST)
Received: from localhost ([::1]:39284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVqT-0000dI-15
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNVoW-0008Il-Jb
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:46:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNVoR-0007Yw-Gw
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631000794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w82DXS41V0yBOaSwUKbdiY+xnL9ar5oIA++ogxys8jg=;
 b=hCe1bat/if1pqTz/jazct2dCASioHO3s52DnUN/aJsiPaqMEHAi+VU+nRvfavJT0HDRZOR
 AuP1Uv4tBQcq463/5Dz5pZ1gTENz2CHLReIbl4LPoqs/07d2f3jYPS0n63XAEYrhyzQits
 q9gPji7Kc4XquURnF8ouwzF7UnM3j6U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-P0nsRJv0P-ewFXd9H8cp-Q-1; Tue, 07 Sep 2021 03:46:31 -0400
X-MC-Unique: P0nsRJv0P-ewFXd9H8cp-Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so808182wmj.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 00:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w82DXS41V0yBOaSwUKbdiY+xnL9ar5oIA++ogxys8jg=;
 b=Pkl/E3N7WrDaKAD1OjmX8uFtyAiqyo7rS6/1LhPHsg46teTMY/KMmPmOc2uLEyh94Y
 UVE0lC6R6pxNPnrmaFKpqkdNa6hqoN4PAEcQr9UTqDWCOO92WG4sXdOE+y4hgT0NkGbu
 s+q80kiOZ2D7pWHhIBGfl3ot90R8pp9r4KtA6zVh+bpqeI7biLjzSXGWPoYuZ0kc/LA7
 3+Nuw6OlK+Dq1/zeExs7wqOeW0C/1uq0gHkxZ++G1um9qNGius1RWSpFoh8DlKUdcffw
 masTujHuEsel89rW+XJz1RognHVGFqrhixsopT0iuVbMz55sWcFwLIeSknpcU1PC9VOz
 2zAw==
X-Gm-Message-State: AOAM533NeHs9VYK1Zy+Sq1Kfm9Q8NhQjTt++wk1b2v6GHwIBCNsVqkqZ
 kZYp0Ir+2KF2cTbGhA7GQuc3FsYFGfC65QYdUDUi+uftWlBIS0copjt0929ZU+mgnfXIR98p2a1
 PUzETYLomWG16YGE=
X-Received: by 2002:adf:90cc:: with SMTP id i70mr17101935wri.408.1631000790580; 
 Tue, 07 Sep 2021 00:46:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOwpoz6ov1HMf/7crVq8pxNvZ/YG+fqUFTeIj1QO0bjW73bZaUnt5td1DzYQs552dyhCtHEQ==
X-Received: by 2002:adf:90cc:: with SMTP id i70mr17101914wri.408.1631000790383; 
 Tue, 07 Sep 2021 00:46:30 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8396c.dip0.t-ipconnect.de.
 [217.232.57.108])
 by smtp.gmail.com with ESMTPSA id o2sm10751903wrh.13.2021.09.07.00.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 00:46:29 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] s390x: topology: Topology list entries and SYSIB
 15.x.x
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-5-git-send-email-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ecf79a25-c5c4-a39c-5f77-56af17f26728@redhat.com>
Date: Tue, 7 Sep 2021 09:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1626975764-22131-5-git-send-email-pmorel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/2021 19.42, Pierre Morel wrote:
> We define the CPU type Topology List Entry and the
> Container type Topology List Entry to implement SYSIB 15.1.x
> 
> This patch will be squatched with the next patch.

s/squatched/squashed/

... anyway, why did you sent it separately?

  Thomas


