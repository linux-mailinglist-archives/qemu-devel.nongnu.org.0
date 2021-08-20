Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668C43F2FF5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 17:46:34 +0200 (CEST)
Received: from localhost ([::1]:38446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH6j3-0001r4-Ek
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 11:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mH6g6-0006Ec-Qb
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:43:30 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mH6g4-0008GF-1A
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:43:30 -0400
Received: by mail-pl1-x634.google.com with SMTP id o10so6232281plg.0
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 08:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=91iZU8ovsk6Gnn6nhVeDDkzIrVkANR5vegj8hJFFcsU=;
 b=kQbml57BwCL2DgO5Na8yh9reepD5aV3kjvMgML/TrCdptulv44BqhHyJ7VfqtiAijz
 H4QdYY3jC0QEgZ1PZS+vjcn89448TOfbxMJ53kJoz/gt1FQ9sCV142Oufvq6SYibGcy0
 9bD461dqURK+q6p0MTP5AHkq0lMt1bwhOo4e12NGXAuFRmMzxAyfeZcRI0lTdxxkgDOZ
 6YWeDGRZ3+q3OxKJEuU1A/xcsVU+WBTHy/1TACMqn4P1JdJTwL9b+c6IP3ZVaYHf/Gn2
 ftrwy7sv8Q6WdeqmB/7b/fxxqhpZU2dsQI8kwfKRBG+p9WxpxPPkt5ecLS61Or5rdQ1L
 mhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=91iZU8ovsk6Gnn6nhVeDDkzIrVkANR5vegj8hJFFcsU=;
 b=SbAU1rlvlZ3tpfWUScYFz0B1PUJIRZSWn7sSaOenpMG1l3mlsIjvtvOyQzG46jz/Dn
 1NAeRUyE9kGggmV4uzRQjYpGq57I8X2xQ+1CWl62Q/HPo5mK1sucGZo0QoC5bCNCgpGc
 zpBWp0NwU89RJpF+oBQx0VTndHu/Z/QgH1uquP07g2AE3Owep+i3RXEuCu57XwO+Ixc6
 QZe4porVxYPh43POex7FBE2kRbucNSyP/2WmeTCcgtTxIIVLqMqB8ITOVx+jjuwf6nIp
 wMSnxXJO5WsQD4W/i9Dk7r1lP3jR7y1/wEtISsgDXpOwh/7WjVlfVfbiOfRI90sV00bu
 ThFA==
X-Gm-Message-State: AOAM530s7jdaf+fqLpwZbiuruwA7fD+v+UzaVPYMd+1YdWR/+XkHJlRw
 dwma8Jd19ei8AMhs6DIN4Undow==
X-Google-Smtp-Source: ABdhPJzyZjU/Nges752iQg+Bwcwb1fk8mSEqNP8/wGgsdrvfZ3WM4BqkkkLeRi8GM4n/D8SAjCRygw==
X-Received: by 2002:a17:90a:f195:: with SMTP id
 bv21mr5264647pjb.218.1629474205926; 
 Fri, 20 Aug 2021 08:43:25 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.156.44])
 by smtp.googlemail.com with ESMTPSA id y5sm12253705pjy.37.2021.08.20.08.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 08:43:25 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 20 Aug 2021 21:13:18 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/acpi: refactor acpi hp modules so that targets can
 just use what they need
In-Reply-To: <26cc841b-792a-305a-2708-b1ed11de8151@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2108202110430.624345@anisinha-lenovo>
References: <20210812071409.492299-1-ani@anisinha.ca>
 <26cc841b-792a-305a-2708-b1ed11de8151@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-1382508667-1629474205=:624345"
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-1382508667-1629474205=:624345
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 19 Aug 2021, Philippe Mathieu-Daudé wrote:

> On 8/12/21 9:14 AM, Ani Sinha wrote:

> > +    return;
>
> I suppose if you replace all 'return' by 'g_assert_not_reached()'
> both issues reproducers crash?
>
> Your patch is not incorrect, and indeed fixes the issues, but
> I feel we are going backward now allowing call which should
> never be there in the first place.
>

Linux kernel does something like this all over the place. They simply
replace functions with NOOPS when they are not allowed for a
configuration. They do this relying on preprocessor macros ofcourse!

It will be hard to do anythiung better without rearchitecting the modules.
That would have significant impact particularly on x86.
--2088271309-1382508667-1629474205=:624345--

