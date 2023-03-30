Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77876D0430
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:59:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phqvW-0007DQ-2j; Thu, 30 Mar 2023 07:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1phqvU-0007DF-FL
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:58:44 -0400
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1phqvS-0004YC-U8
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:58:44 -0400
X-IronPort-RemoteIP: 209.85.222.199
X-IronPort-MID: 269938813
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ccwur6M8E76CacXvrR0blcFynXyQoLVcMsEvi/4bfWQNrUp30zQEz
 2QdCGmFbveLZmGmfNB2Ptnk9B5U78KGyYcxQQZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656yEnj8lkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjim4c3l48sfrZ80s056yq4Vv0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE4ORCK2gpPZ0koe9JX2dn+
 O0eASwSYUXW7w626OrTpuhEg80iKIzyP9patCgxnHfWCvEpRZ2FSKLPjTNa9G1o14YeQLCEP
 ZBfMGs+BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvTmCl1whieOF3Nz9ceLbS/wOhGij+
 mub0Dz7WyBKCc3F4G/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR4yl36KZrpR3tQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjFsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:19AZdapyGStN4DORCjQpolwaV5oDeYIsimQD101hICG9E/bo9f
 xG+c5x6faaslsssR0b9exoQZPwOk80rKQFmbX5Xo3SPzUO2lHIEGgK1+KLqQEIfReQygc378
 ddmsZFZuEYQmIK6foSpDPIderJ/bG8gcWVbdi39QYVcelJA5sQiDtENg==
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 07:58:36 -0400
Received: by mail-qk1-f199.google.com with SMTP id
 206-20020a370cd7000000b007467b5765d2so8788430qkm.0
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 04:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1680177515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MGSsQrurj36w9LLG/vqOxxOQCJUayI+JCrLzJXYBM4A=;
 b=dZFpRKbYBG/KyARr4wEIliJ0u/9P6PMBg4MmKfaB3oMpKRrCfSZOQcRoDcEVNLJPJ6
 hafwEJUpxVzp0Cb+hmsux0ro4VZvrfTsOT5ocrjvhdjj7GS44AoXNv7aEsDcB74y6VIX
 ZRctq8rns0wS3/nAl1jl/EHj3clcaaowN3OOyCawTQ0OXQ5DzeZEuDCpvGEUXXhaQ3II
 10ruSohfnDPOmxHn7drAZ+grDcqzYVoVNoc5csTJlYd2aM8XQxdD3Ma+Tz/aI/nA5wpN
 Vdz6Js7wDH9NM8Rvz8XM4pjvGg/Mu4eYVd/8FwI0ql2UvNDse9W+nUkhAxeva9igUeOC
 Kpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680177515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGSsQrurj36w9LLG/vqOxxOQCJUayI+JCrLzJXYBM4A=;
 b=sFd1PhTnR+n7qfOYpHl8ipoyZ7+K9OBEfvbq5vkPL8zo9pugKkKDzKLUsxzto6hT88
 pokm9qy+CTWpE46x0LksT5AAbGKy20g90Iwwc7tTpZ4wjkJA2EdkBcZGpSa37u9Bth8O
 Tc7AO/KZg7aZoytXOh94Gp3YkL0kO7ngWJGzBECQwWOKyy0LO8TIBQXrfp5B57KD+6Gi
 bCRi5NPGX26xRu8S8a9W8Ciy1guNdR68XKwKwYY0/QzAwdHSfvmkMlqsKWzy9WhXsmmq
 kZMsxozUhxgNhyLYr0boelJcT3wXXBeYd3Xi4PmqcskMBbqK9q6wM2yev9toXesOAiwc
 GhmQ==
X-Gm-Message-State: AAQBX9dixwDHyd2VR37WHBmHe1HKVad5CAm7sWMyXSMJ7wjhzAsEB9r9
 S85jrXG8Gaom0ikBqtzk99W7NHt52V/obiejBqhBPrfYlTcC2DSzmizF1sFKN4xvFOda5GmhwUt
 LZ4oUGyj9JpmQnT2ZG4tlo0uJj0+RnQ==
X-Received: by 2002:a05:6214:230d:b0:56e:afe2:ebca with SMTP id
 gc13-20020a056214230d00b0056eafe2ebcamr39329951qvb.30.1680177515211; 
 Thu, 30 Mar 2023 04:58:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yez9R1xLbUpvcoSJmsl8AUqrqqBcutBqO/lE+HnkI3nF5kOuUa2wwYG7QXiGmMSHR4SfWzQQ==
X-Received: by 2002:a05:6214:230d:b0:56e:afe2:ebca with SMTP id
 gc13-20020a056214230d00b0056eafe2ebcamr39329936qvb.30.1680177514978; 
 Thu, 30 Mar 2023 04:58:34 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 ny15-20020a056214398f00b005df51f70956sm1295469qvb.22.2023.03.30.04.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 04:58:34 -0700 (PDT)
Date: Thu, 30 Mar 2023 07:58:30 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3] hw/arm: do not free machine->fdt in arm_load_dtb()
Message-ID: <20230330115830.gj5ntltek3auh4sz@mozz.bu.edu>
References: <20230328165935.1512846-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328165935.1512846-1-armbru@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 230328 1859, Markus Armbruster wrote:
> At this moment, arm_load_dtb() can free machine->fdt when
> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
> arm_load_dtb() will make machine->fdt point to an invalid memory region.
> 
> Since monitor command 'dumpdtb' was introduced a couple of releases
> ago, running it with any ARM machine that uses arm_load_dtb() will
> crash QEMU.
> 
> Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
> of freeing 'fdt', assign it back to ms->fdt.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
> Reported-by: Markus Armbruster <armbru@redhat.com>i
                                                    ^ Seems like a typo

                                                    -Alex

