Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B415402E1D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 20:05:33 +0200 (CEST)
Received: from localhost ([::1]:39042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfTP-0006cf-TN
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 14:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mNfRj-0005WR-QA
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:03:47 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:41689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mNfRi-00088P-1W
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:03:47 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so10281wmq.0
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 11:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GKdl0whZTIjm7hVftbuNU8lkVF7amNED9SxntEvVB3w=;
 b=MBh7ScN743cXlJmQlDpnML5z3EVsiIbACpS4JcDVja8Ja0mMPdzhk7WtGKIkA2Z+O4
 ogaMktjHG50jBA7LosLTeAm9X6hxNzZkwweZ9a/YLuE4V0kPIB0IC8NQal1e86Eeg8sv
 XLBKI0/gifAr5ErXlFKIaYQd4ClDOtHzjgtU11IlcfY0pGHci1Gaz+i7ahaMADNTmBXH
 Yk27AvSxFZdsGyBPxV6q2ZSQAxDyAw6BaFmsVNX2TzGJ7HxJIjoO6D0VX88SErElaXte
 R6kajEdSaSY8Y712zy7tPtmw4oBJ5rOKx7pByqu+lyVp9mdbZTK6E0DuWI6syPU5LFX8
 TjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GKdl0whZTIjm7hVftbuNU8lkVF7amNED9SxntEvVB3w=;
 b=cUc2Jnds8JrCv5qBSK774AxV4LM4/q6UglsKi5XUvxEyOWdPnegkqrl8cSAoURiIXl
 n5XXTpUAlxk6esEJUKImLEet5Fn7eyH6xd1LxbamWEvFfltu1vTAMdq8mxDJ4zX4Fw2Q
 nV+DoOiAC5WOl9KaQFvZkODi/hqfjWEog/BGNlsf7LgSVUNZ3Qbvg00iP+Xj6EAQoRNt
 XsMsWQwQJZTF58lRT6betev8XreZBjcBtZ8MQkSSjPAr9DHIhfjzWHBP0Ea/FTGnlV0J
 8I1ZiQQ7hmO32JcMZfA+SqY9oiJ69T/3s1yTDG+AyTebSricN7wVl4bz9q+oqBPAnMjN
 u+2g==
X-Gm-Message-State: AOAM533ybb8t3wo6EJSJuYgwFKvDZCdAtWejvhnBZvM5Zr+kRkcdvMFI
 EzvBkNcqvxNbqn0RTWXs0MXvrw==
X-Google-Smtp-Source: ABdhPJwFZLMNrUceSsl67VTlMhJDkNSTXgkg5aAz1Mo5VCMoinPmvv/3eo/eOfzVvWMaNQZ99CT/rQ==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr5109277wml.47.1631037823226; 
 Tue, 07 Sep 2021 11:03:43 -0700 (PDT)
Received: from larix (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x13sm2856675wrg.62.2021.09.07.11.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 11:03:42 -0700 (PDT)
Date: Tue, 7 Sep 2021 19:05:53 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] hw/arm/virt: Rename default_bus_bypass_iommu
Message-ID: <YTeqAaZJDQRVUrhB@larix>
References: <20210811085842.2511545-1-jean-philippe@linaro.org>
 <87o89nnus1.fsf@dusky.pond.sub.org>
 <87o89m7zai.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o89m7zai.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 25, 2021 at 09:34:45AM +0200, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
> > Did this series fall through the cracks for 6.1?
> 
> Missed 6.1.  What now?

Patches still apply onto master. Please let me know if I should change
anything, or provide backports for 6.1.

Thanks,
Jean


