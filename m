Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A522469E148
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 14:29:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUSh9-0001XO-CZ; Tue, 21 Feb 2023 08:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUSgu-0001OY-2T
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:28:21 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUSgr-0007Ct-KV
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:28:19 -0500
Received: by mail-wr1-x435.google.com with SMTP id c5so5121653wrr.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 05:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tuIcvfv9WUBAl+JLA1VdjtOzjEZuupAZkQ4PsvSqKhA=;
 b=eBab1Yf2zQu33CQkOPpYeebgeerbqYFVLD/JOw/U3qdvoIb73BKX3WSVy0MqU/uOX0
 EKHZA8IiXmF//lxIzKf0Be67faYlqjwDVsw7ABKTc2Vur3qK9ZwGZdvmSoEsSP1nyojA
 /k1aFQBQosZr8IMxAKdodLuvTI7Pdz20xhSvU2C0Y9WBbFzdTLaB33TRf+bCZv+qhTjn
 OgoCcb6gqNceMDr78/7pNCJ+J+9QCCkprY6NBJZ7sFEPBFAEEj+G3i9Z38gRygPZt7jI
 nFI+TjUe/PCqZ4jMe4fU6r0kiUQMUig3Mhxu+8Us9wfGgtDx34XTCVxJw0CrjCXGzsnz
 s0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tuIcvfv9WUBAl+JLA1VdjtOzjEZuupAZkQ4PsvSqKhA=;
 b=Qz8KAaL0x4FdIki7G/TCMGt4bHyjisgNrEnfxiZc23iIp3tT3ex/XsE7KFxcgh0xsp
 fHkdIet8jZDo6BmhW52d/ih0YPEVRYomBqJp4Nda01jEy15ymA2edz+5AXhhQLnZyTV5
 tsO+zBbYmxV6Gat+TKgT/71YXY65InG2etvWslhinun+A2WmnIiQChs4q3u7QbnR7UmD
 fXa7JhS/3v1bE9zdfF/quCuiyBA+WfNpaAPtEStZcvhfwMCu3HgIhxeiOx6T0U4klN6q
 ZItZp6AiBibW0L8fD2KdQRS/tYxr7gYny5tL8b2mCAQDa6C5SeqYGBcOEZf6T78EUzXb
 IEFQ==
X-Gm-Message-State: AO0yUKWqVtXJo5nbhIpOjfLIrIi2eDc1JTQwllwrJ8zkHfZrfFMpCxiP
 TZQcnhMPDEiBSmre8F6+TuOk+Q==
X-Google-Smtp-Source: AK7set+cfgBg97tsPl5+fE+jKeFRPRVOVYpXVzxGVmQIFhGCiu7BJjYCJHcHe5Gio9n2AyJgpgk0YA==
X-Received: by 2002:a5d:540b:0:b0:2c5:5ff8:6aff with SMTP id
 g11-20020a5d540b000000b002c55ff86affmr2675658wrv.3.1676986095680; 
 Tue, 21 Feb 2023 05:28:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b4-20020adff904000000b002c54f39d34csm7959389wrr.111.2023.02.21.05.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 05:28:15 -0800 (PST)
Message-ID: <bfee4925-4de3-0f2a-1d97-6ae641ed287f@linaro.org>
Date: Tue, 21 Feb 2023 14:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: hw/ppc/virtex_ml507: Problem with CPU IRQ#3 (PPC40x_INPUT_CINT)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Edgar,

The Xilinx Virtex ML507 model uses 2 different interrupt controllers:
- Universal Interrupt Controller
- Xilinx OPB Interrupt Controller
Both are connected to the same CPU IRQ line, IRQ#3 (PPC40x_INPUT_CINT):

108     uicdev = qdev_new(TYPE_PPC_UIC);
109     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(uicdev), cpu, &error_fatal);
110     object_unref(OBJECT(uicdev));
111     uicsbd = SYS_BUS_DEVICE(uicdev);
112     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
113                        qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));

240     cpu_irq = qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT);
241     dev = qdev_new("xlnx.xps-intc");
242     qdev_prop_set_uint32(dev, "kind-of-intr", 0);
243     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
244     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, INTC_BASEADDR);
245     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq);

How is the hardware wired, is it using an OR gate?

I couldn't figure it out looking here:
  * https://docs.xilinx.com/v/u/en-US/ug347
  * 
https://www.xilinx.com/content/dam/xilinx/support/documents/boards_and_kits/ml50x_schematics.pdf

Thanks,

Phil.

