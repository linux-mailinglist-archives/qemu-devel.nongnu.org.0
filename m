Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C3A3BE757
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:43:57 +0200 (CEST)
Received: from localhost ([::1]:53036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15y8-0008K2-2Z
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m15wd-0007aI-Pt
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:42:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m15wc-0007Dn-9E
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625658141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j9T3GnCA8wfntN0CdYy8i40Ut1YnoWrbRiqGtGY5UVQ=;
 b=S6CDVjlCPJZbJkzKKNMXWiwOscgRiEA/CpJEJcR4J3EHUtKAbBnE+WOMJe3A98u7Iae6Ci
 3l4RetZHh7g25mO+/KE6nc0SsFyMPCiw3SK6fUwAiT4JtbKIpwOkQWzWrwcFjRpycx0r8F
 DXWVrReX6aM49ZBGK59dl6TVh6ogm2E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-i6dvkRZpPfasbNzW2hafGQ-1; Wed, 07 Jul 2021 07:42:20 -0400
X-MC-Unique: i6dvkRZpPfasbNzW2hafGQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso678383wrh.12
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 04:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j9T3GnCA8wfntN0CdYy8i40Ut1YnoWrbRiqGtGY5UVQ=;
 b=aJ+ItsIuXCIfO23ZIcF5FhR2dsbTOIcZTOEvyRi3lJkFIRyYbrmow6EHcBAZ3dZa5m
 Gi2hppKB7XM0dzg0M3Y3fPnVQAecClkQXqef96KA3TMa/yYfuMgvMVmm2k40mEDZk2MP
 KUyCjSK2RHE810dURq7WV535qY/M7vgugBmwxapMcVuZ1LtZcAWeXuq7j9EKUiBr52lb
 T0QxAtlAH1PuQKwaJieDONCRNT69VSklr7wHCowbazNFSdu5Ya7ME5oBkRTL5QHMpwqj
 xMyTXMTmXezGjCrhBwB+eMs3Wg9/pfpUvt2yyTuNVqCQCz3r2fmY8m5y/N4YdT/Ystdj
 w9Pw==
X-Gm-Message-State: AOAM533dfEUArvfOCFfk3GCUe0mfjwPJPZupLpdyLiUtrMT3COeNWwyv
 ht87xapXbGKMKPLq6JwvYYfhngVRUgvBNDYcTQSevEtLlZ/8lW8sxVDbrXNTrUpvmZ9F8oGnRpw
 +ApQol9vkaUZh6Ik=
X-Received: by 2002:a05:600c:2052:: with SMTP id
 p18mr6408746wmg.168.1625658139389; 
 Wed, 07 Jul 2021 04:42:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkhdZD4bi0rfdGGmM4qZ/chFEd1uJXlBNzBzd8OKbr7TTF0QfTa4gzPX4gecdJectZe9UHvg==
X-Received: by 2002:a05:600c:2052:: with SMTP id
 p18mr6408729wmg.168.1625658139205; 
 Wed, 07 Jul 2021 04:42:19 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ead.dip0.t-ipconnect.de.
 [217.87.94.173])
 by smtp.gmail.com with ESMTPSA id b7sm16301029wri.96.2021.07.07.04.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 04:42:18 -0700 (PDT)
Subject: Re: [PATCH v7 09/14] target/s390x: split cpu-dump from helper.c
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210707105324.23400-1-acho@suse.com>
 <20210707105324.23400-10-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5353cc41-c8c0-d327-4dc4-cd6e9a6d3da0@redhat.com>
Date: Wed, 7 Jul 2021 13:42:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707105324.23400-10-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: cfontana@suse.com, Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/07/2021 12.53, Cho, Yu-Chen wrote:
> Splitting this functionality also allows us to make helper.c sysemu-only.

Maybe add a sentence that you move some other functions to cpu.c now.

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


