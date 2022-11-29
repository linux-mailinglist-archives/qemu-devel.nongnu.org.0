Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C8663C08F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 14:08:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p00KZ-0005v2-SZ; Tue, 29 Nov 2022 08:07:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1p00KW-0005t6-V1
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 08:07:20 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1p00KS-0000uo-QF
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 08:07:20 -0500
Received: by mail-ed1-x535.google.com with SMTP id l11so19681657edb.4
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 05:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7w6RtRND9hTDHKUwPCEuYhSwM1DrUxz/SuPUU4pwGj8=;
 b=q4RrMhlRUkiN2NreR90GgujP5X7f0mUXg2CZwKNU7t7Qgt3OuaWcgzhAMkWgsaYWEz
 DazAn6Zxob7PsSV0/Z77icAzJOEC030j9/4s6YLBrFjvS/9zIQd+aR2Go5SZ57iDj4Wq
 RgNXRW6Euyh00fiZj9hNoSm3zdiUxiuHMZZiXsCxzhwyOEOjKFOj8R5CGKxAaEnIaU7/
 OxzLPnDCw0wStDXC2uaFrTBVTXBuXIBRStWmxG4v9LVEOBxZ6aJh3kDy08cky1b4RLVb
 I/G9xwN5U/liYKZ6D5fgVOm/BVMBMco+aWhI7MchnY9uRTPdGCr4EkbsR5hS2ClgK8Jw
 JpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7w6RtRND9hTDHKUwPCEuYhSwM1DrUxz/SuPUU4pwGj8=;
 b=pj/1tuhYxCnbN6lT/+H44G1bpr1FFwwatX5ewj/m/Rcf068ZpnRnfNjA6n9PrScEEi
 H46V1v1+E9AuA6HHsoA++OdDmtCF6eQ3BhZ4vcnygjrY3MF9i8nID2F+34naj6tAz4tD
 LWIn99KFomQ6LkJtM/8k7d40ql1JwpPoejI7qR+jFtXOOt8zP5JCQn00kKJb/6IbDjMX
 yHiD1tfaEr/hNqrjS0+1PBp+Mx8l5gd6aGZVcXq2GvW+s4/3Q5n2H9VmUk2bIbwpv1P8
 0gCkbiHUmHq6JkRss9mon6u7a61baSTXI+J15gP0Y8C607f/tExC19m7IxeJ1/UuZLbk
 2gxA==
X-Gm-Message-State: ANoB5pkcSrwfb/aMaslsr7UsbhPbYm52Sfb3vBbdSGBsu3LuTkxCKXIC
 XhZ3VMIqZ5zU9iLYinOXn3Ifz5cNYWQ+O4GAQVK0sOOmXUP8LQ==
X-Google-Smtp-Source: AA0mqf7Nr1QrXUrfgrTN06h34rXVnAPYjGZPBV8tHOH9oVVOs8nk+UtQpvtJxDDs9lBwWPQ0uODP16mq32v8Azgc4IY=
X-Received: by 2002:a05:6402:1814:b0:46a:b1ba:22b8 with SMTP id
 g20-20020a056402181400b0046ab1ba22b8mr19652826edy.316.1669727234186; Tue, 29
 Nov 2022 05:07:14 -0800 (PST)
MIME-Version: 1.0
References: <000000000000fbc90205ee880a96@google.com>
 <6550d23a-a790-362c-9d00-ed16dd43093f@linaro.org>
In-Reply-To: <6550d23a-a790-362c-9d00-ed16dd43093f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Date: Tue, 29 Nov 2022 14:07:03 +0100
Message-ID: <CAPMQPELTikBM+j89wNg-TLf1P-Z6qZbO2AgK_HiMO-YS9kW+Lg@mail.gmail.com>
Subject: Re: KVM developers conference call
To: qemu-devel <qemu-devel@nongnu.org>
Cc: quintela@redhat.com, juan.quintela@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu-daude@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Cc'ing the list...

On Tue, 29 Nov 2022 at 14:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Juan,
>
> On 28/11/22 14:42, juan.quintela@gmail.com wrote:
>
> > KVM developers conference call
> > Tuesday 2022-11-29 =E2=8B=85 15:00 =E2=80=93 16:00 (Central European Ti=
me - Madrid)
>
> > I think that Richard and Mark wanted to talk in tomorrow call (I forgot
> > the topic, sorry).
>
> We want to discuss around QEMU system emulation: single binary and
> heterogeneous vCPUs.
>
> Mark wanted to discuss dynamic machines and external devices. He can not
> make it today but we'd like to reserve the next slot for "External Device=
s".
>
> Today we'll cover multiple TCG frontends and possibly Problems of
> dynamic machines.
>
> I added the agenda on
> https://etherpad.opendev.org/p/qemu-emulation-bof%402022-11-29:
>
> --
>
> A) Single-binary multi-tcg frontends
>
> We'd like a single build of QEMU using several different TCG frontends.
>
> symbol collision -> dynamic libraries and force hidden visibility to all
> the symbols (static with prefix hack would be an OK stepping stone)
>
> Alessandro Di Federico and Anton Johansson almost have a PoC loading
> frontends as shared libraries (only user-mode so far).
> Updates: https://pad.rev.ng/i0N4yVkcQEWw24tqWsj6rA
>
> Use of current_cpu from generic code (Alex Benn=C3=A9e working on removin=
g it)
>
> target specific macros (notes in https://pad.rev.ng/s/8cjdhsvtH)
>
> TARGET_LONG_BITS
> TARGET_PAGE_BITS_MIN / TARGET_PAGE_BITS
> TARGET_PHYS_ADDR_SPACE_BITS / TARGET_VIRT_ADDR_SPACE_BITS
> NB_MMU_MODES
>
> TARGET_BIG_ENDIAN
> Philippe Mathieu-Daud=C3=A9 working on removing this macro from hw/ devic=
es,
> and from tcg backends using MemOp
>
>   B/ Dynamic Machine Models
>
> Instead of having static machines created using qom/qdev API in code,
> we'd like to create a dynamic machine at runtime.
> Basics:
>      - instanciate object, set properties, realize
>      - wire IRQs
>      - map memory regions
>
> GreenSocs proposed to use scripts to generate QMP commands in the
> pre-config machine state.
>
> Is the SysBus API limited? If so should we convert SysBusDevices do
> plain QDevs?
> Time to deprecate non-QOM/QDev devices? Keep them in legacy
> qemu-system-ARCH?
> Machine Reset issue: MachineState is QOM but not QDev (DeviceState)
> Is CPU reset() still different from any device reset()? If so, why? Can
> we unify?
> Peter Maydell started converting some devices from legacy reset to
> 3-phase reset
> Markus Armbruster mentioned the QAPI error path is not designed to
> handle qmp-device-add failures at runtime
>
> Previous work:
> Generalize the sysbus device machine allowance
> https://lore.kernel.org/qemu-devel/20220331115312.30018-1-damien.hedde@gr=
eensocs.com/
> This series transforms the TYPE_SYSBUS_DEVICE allowed list that exists
> in machine class model into a TYPE_DEVICE allowed list.
> qmp-send program to send raw qmp commands
> This script takes an input file containing raw qmp commands
> (concatenated json dicts) and send all commands one by one to a qmp
> server. When one command fails, it exits
> https://lore.kernel.org/qemu-devel/20220316095455.6473-1-damien.hedde@gre=
ensocs.com/
> Sysbus device generic QAPI plug support
> https://lore.kernel.org/qemu-devel/20220524134809.40732-1-damien.hedde@gr=
eensocs.com/
> QAPI support for device cold-plug
> https://lore.kernel.org/qemu-devel/20220519153402.41540-1-damien.hedde@gr=
eensocs.com/
> qemu-system-any: system emulation aiming to target any architecture
> https://lore.kernel.org/qemu-devel/20220215002658.60678-2-f4bug@amsat.org=
/
>
> C/ External devices (Mark Burton, 2022-12-13)
>
> User case: How to use a SMMUv3 implemented in SystemC?
>
> The "Multi-process QEMU" provides the RemoteMachineState/RemoteIommuElem
> interfaces which relies on a PCIBus. Currently related to vfio-user.
> Could it be useful if extended?
>
> We want to keep the memory management in QEMU. Can we directly expose
> the MemoryAPI? Can we avoid external device to take the IOLock?
>
> Mark Burton: What we should do is use async_safe_run_on_cpu to ensure
> the QEMU is quiescent before calling this interface. However that will
> require some rework. Not least because we will (typically) have a number
> of operations to perform, and they should (ideally) all be performed
> =E2=80=98atomically=E2=80=99. One option here MAY be to create a =E2=80=
=98transaction=E2=80=99 and then
> =E2=80=98execute=E2=80=99 that using async_safe=E2=80=A6.
>
> --
>
> Regards,
>
> Phil.

