Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10134A8C97
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:39:44 +0100 (CET)
Received: from localhost ([::1]:34122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFhxI-0002DF-1i
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:39:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFh0o-0000uy-RB
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:39:18 -0500
Received: from [2a00:1450:4864:20::629] (port=34419
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFh0n-0008JM-Bi
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:39:18 -0500
Received: by mail-ej1-x629.google.com with SMTP id h7so11570795ejf.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 10:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lGpDjeXAafoa/SxB6nilLYbOwMk3HmHkw9GV4YTxjMA=;
 b=Gt+b1sU506pMO/kiTg3C4QLwJ8h4JmpEPMS+1Wk2upTPOwSRH9KBD5xNhgutT+XKxx
 ADJATtaTib1eEtDVHTxvY8CcaNAokCAPhklY/VWF5j/fLo0xrnR4vJwXCmS7jt0pLdUB
 jYmxt1bP5ob5i4LPFPo61CNQcU6VMBHpx4skAjB21YIJFRtRFQ9m4XTx1qGulNGBtKw0
 Dyt3Dyb5x9hbhQmQG3+ZVZqs1hs+il6EDFLs8P9AF+UhalNi/MSwHeXBi70G8Ykafa80
 Dd7sUr786n+w4t+1Iq6YZXSVn2a3zvrZoWszQjZQFDzz/THAi4426FcEp/84VLaYSErz
 JlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lGpDjeXAafoa/SxB6nilLYbOwMk3HmHkw9GV4YTxjMA=;
 b=bs29gICSoHHI2B/3syEhYvlpF3seTptA5KRGLxkbuCIpKid9YUDde6ZFLeWx6dcnit
 QYEoFFJlny3XJ0983LyZMSS5ucZTXgr9120MKhoBDIesijKCGDrwaMtYX15GITar3Uc8
 UNDI8bO0b9CkAiDl/eoGzhF3DciEJB6QxVmH+2fyyfhbSv4hkq/N+4wsa8hkXuJI0kiC
 VaSVDkRpITWi4GJcCEF8hhBmrG7XlIqWy/ZckCtVIfDGEhLolh5o3N/CGXxb1ztmmWw/
 PFCrwzrlrGsGKQ0A8hdkuvb5gWzBqS3uZ4cNt8OrM/+Z1YibeQgdbatRySZTdc6iN5Wm
 606A==
X-Gm-Message-State: AOAM531V2n0TtmmqVDjOP6GlW4cZ5X+nP878ZyY2nkh23GPRrm9/BtEa
 hxIU60XD2o2654BGfS6StV8=
X-Google-Smtp-Source: ABdhPJyizT41ceP6AHAQ7BKyOklSPfA/7IHb+VcPOaBajKud74SrRKL1iRChMdAfvecT6pc+Vi5WZg==
X-Received: by 2002:a17:906:7f90:: with SMTP id
 f16mr30506247ejr.387.1643913545902; 
 Thu, 03 Feb 2022 10:39:05 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id f6sm22671438edy.18.2022.02.03.10.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 10:39:05 -0800 (PST)
Message-ID: <e5092075-2c7f-d070-d59d-f82ceb02aec3@redhat.com>
Date: Thu, 3 Feb 2022 19:39:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/3] qmp: Support for querying stats
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
 <20220131194312.1192626-2-mark.kanda@oracle.com>
 <YfkiyiK+jfrdbVcY@redhat.com>
 <b111f7a7-ab0c-8944-ec3a-9461eb0e4fb3@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <b111f7a7-ab0c-8944-ec3a-9461eb0e4fb3@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 19:12, Mark Kanda wrote:
> 
> I added the 'unknown' member here (and in other enums) to handle 
> situations where QEMU is behind KVM in terms of enumerating the various 
> stat types, units, etc. I feel this will be a semi-common scenario (old 
> QEMU on a new kernel) and with 'unknown', QEMU can at least display the 
> raw data.

I think you can skip them, there aren't really plans for new types (the 
"metaschema" is based on one that has been in use for quite some time at 
Google).

Paolo

