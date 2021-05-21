Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3804138C565
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 13:07:38 +0200 (CEST)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk30D-0007je-Ai
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 07:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lk2zU-000751-FA
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:06:52 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lk2zS-0003R8-Ht
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:06:52 -0400
Received: by mail-pg1-x533.google.com with SMTP id 6so13933420pgk.5
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 04:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iWD9Tc/v/LNCeNJ/pfXU/wGEcMZsUwMNmBhpAyUWFGQ=;
 b=qCt9O7kApvXKgwoxZ/K+ilJuq/YL130LjRG5j0s+2Py3vMOdYy5vkrXKcOvbpmmz+v
 HqLifWyxe8BKueDeJ4o2fECaQ12E4TVVa81Cg7JzP7+YeAuxNyIdEqUEIXXeb19wEyt6
 zdpNZ7dUCjdSRZVlXicQ48PA2bZGC2vD4Ymml4u8gzS43XUocPZj8WDT/1SHzjunrQNI
 XhTo6XNXpUppyoq1bAGqXb39WjhNWLOJebcFGjVs26LUUVk/OJzpJbCIkFW8J+aGQoqc
 9m2gqBWG/fFUkhOtDJR+rLmSSqTE37XFEX8DsOLp84em/vdPDP4bSBFkNC0xTDgR/T2W
 ZKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iWD9Tc/v/LNCeNJ/pfXU/wGEcMZsUwMNmBhpAyUWFGQ=;
 b=X9JzltBuF9AhT5Mvh5vWzkGXAP+ukAgHmko19/ZcLOslpU5MF4lTiHHa8AUYXXv8So
 6sd4MZUHJ1PWl05RlirzSC3exAhwpuVtK0jZiBMTJqQirqzZKgqp+2gJJGRCxmFXgeP3
 vQItD7HGVYjYx15yo9kQkfhveWL+KTzmx507q4y8Ldhqnur07v4SJ0hSc1Uk9qveqzMb
 HFPVtKyl4PmgpZKzbBkEifferXSyVS0uMOQS2kdP8NtojhYc4JyBW4uQ5BjidHJkmwI6
 TRTJS+FJlYibyy1EmREIYUZLxJLDJA8QBnwa3dY4Ot2uE5FKuW6FSWwk3bJsBjcMCKiX
 eoKg==
X-Gm-Message-State: AOAM531ED7xTWdbGgLTXnoWv8IeL3rvn9Eu3GN/ZEvbdhBXjqD4xKmw+
 Scu0p8fWkbM15xl3TA9HMooeLg==
X-Google-Smtp-Source: ABdhPJyUMQXw09zBQOxfwAUPhmEqOvmgQZA5jbf/NRRpKEMVl2mXpM94z02o/fziYhWGnmAdHeqESA==
X-Received: by 2002:a63:3686:: with SMTP id d128mr9187229pga.305.1621595208064; 
 Fri, 21 May 2021 04:06:48 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id i8sm4623246pgt.58.2021.05.21.04.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 04:06:47 -0700 (PDT)
Date: Fri, 21 May 2021 16:36:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: stratos-dev@op-lists.linaro.org
Subject: Re: [RUST] Add crate for generic vhost-user-i2c backend daemon
Message-ID: <20210521110644.7rvps7zo4m42vefk@vireshk-i7>
References: <20210428122247.ymwshfuoojxzsebf@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428122247.ymwshfuoojxzsebf@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, qemu-devel@nongnu.org,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Trilok Soni <tsoni@quicinc.com>,
 Mike Holmes <mike.holmes@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28-04-21, 17:52, Viresh Kumar wrote:
> Hello,
> 
> In my earlier attempt [1], I implemented the vhost-user-i2c backend
> deamon for QEMU (though the code was generic enough to be used with
> any hypervisor).
> 
> And here is a Rust implementation of the vhost-user-i2c backend
> daemon. Again this is generic enough to be used with any hypervisor
> and can live in its own repository now:
> 
>   https://github.com/vireshk/vhost-user-i2c

FWIW, I have updated the implementation to support multiple guests now.

-- 
viresh

