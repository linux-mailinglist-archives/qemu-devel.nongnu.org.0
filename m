Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213152D2BA7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 14:10:39 +0100 (CET)
Received: from localhost ([::1]:35012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmclJ-0007w7-24
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 08:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmchm-0006dw-Ta
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:06:58 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmchk-00049g-JR
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:06:58 -0500
Received: by mail-wr1-x436.google.com with SMTP id k14so16185982wrn.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 05:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HeoU+W3L2gs9q7NyfsO9z0H346AaIw7XQqUfGhEgqx4=;
 b=b1dQujhrf/A4wzq4tZo6EZAjJ21z1YcoPo2VcKdLq6rROnhuS+7gM7mlpoztuNJ4l9
 5WSUY/DVOgCv/Gvdt4kssfJzAEmqQnM4dsxnfGWthlS6xtcTqD7Oi2KNNiYQodQ0jL4G
 kLe+vWVe77F3QsSnHGwCfEYby3cM+Y0KqYbty78dI4v27DOfDM6pT269XGiK89efqpqM
 fEYqIy4im88HCKxPwwNBgdvKdtFExVtC2WKEvHdXRw/ksdHxI5yFL37eRBONbmxLAu1I
 s2XOKi82WBGmGe+IOa5OUuAHDvJAaPFw4+3ZTsRxWieZDD3ckIS/gpNcC70CF2SzceIr
 mI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HeoU+W3L2gs9q7NyfsO9z0H346AaIw7XQqUfGhEgqx4=;
 b=LJOfRQzAc3uT5EvPag7CDyfozOU5y+mB71CuxtqIbWMqYc2IMqzu+ITF99wEJGcS6i
 Oqb03Gw8OfD7lLo2dLoeo4n1ezl1cAB+mYEmv4C2JiQlTu+wU9CsBQPITUfQbuTFTBVR
 fImnylbY8NYJfpCJ4hH6Bmu4YwGa2F3UT9MXUKudzrBH7aMjRGAcTcxn8gD8sZ6qlp4y
 sR+nxnhqels4QclupaK0Z0Pqq+/v/opTV0eChsDFNjXGj8Ou1yMPx1Klpi99dd94adfl
 mdULsv+ZaGMvzRPmky378aLHa9AJLKbmK7ut4HpcDeN+ItI1lJRRdUnqVfNfHiT7BGfe
 Y29A==
X-Gm-Message-State: AOAM533zFm1FcXuWxwnE+NA447GHU0p2rXKvpEOQp6Brubl9vSIwZvD7
 pflZRrK/ZhC+qzDC+Lx583qJ9w==
X-Google-Smtp-Source: ABdhPJz/0tyHecKao0UPhOuygG7//NLjRUpy4BOdKoBlNsYbUa/gC62cE7Xy4CBJopts9N473krB8w==
X-Received: by 2002:a5d:51d2:: with SMTP id n18mr18331924wrv.92.1607432813899; 
 Tue, 08 Dec 2020 05:06:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d187sm3508748wmd.8.2020.12.08.05.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 05:06:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0E1FD1FF7E;
 Tue,  8 Dec 2020 13:06:51 +0000 (GMT)
References: <X86YnHhHMpQBr2/G@strawberry.localdomain>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Plugin Register Accesses
Date: Tue, 08 Dec 2020 12:17:27 +0000
In-reply-to: <X86YnHhHMpQBr2/G@strawberry.localdomain>
Message-ID: <87a6uoh2fp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: cota@braap.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> I'm trying to migrate to using the new plugin interface. I see the
> following in include/qemu/qemu-plugin.h:
>
>> enum qemu_plugin_cb_flags {
>>     QEMU_PLUGIN_CB_NO_REGS, /* callback does not access the CPU's regs */
>>     QEMU_PLUGIN_CB_R_REGS,  /* callback reads the CPU's regs */
>>     QEMU_PLUGIN_CB_RW_REGS, /* callback reads and writes the CPU's regs =
*/
>> };
>
> But I don't see a way to access registers in callbacks. Am I missing
> something?

No - while those symbols do inform the TCG to not try and optimise
the register file we don't yet have an API for the plugins for reading
(or writing) the CPU registers.

There has been discussion about this before, I'll quote what I said
off-list to someone else who asked:

  > Has there been any clarification or softening of the position that=20
  > exposing register and memory contents to the QEMU plugin would provide =
a=20
  > way to circumvent the GPL of QEMU?

  I don't think implementing read only access would be a problem and
  should probably be a first step anyway.

  For registers I think there needs to be some re-factoring of QEMU's
  internals to do it cleanly. Currently we have each front-end providing
  hooks to the gdbstub as well as building up their own regid and xml to
  be consumed by it. We probably want a architectural neutral central
  repository that the front ends can register their registers (sic) and
  helpers with. This would then provide hooks for gdbstub to cleanly
  generate XML as well as an interface point for the plugin infrastructure
  (and probably whatever the HMP uses as well).

  Memory is a little trickier because you can't know at any point if a
  given virtual address is actually mapped to real memory. The safest way
  would be to extend the existing memory tracking code to save the values
  saved/loaded from a given address. However if you had register access
  you could probably achieve the same thing after the fact by examining
  the opcode and pulling the values from the registers.


>
> -Aaron


--=20
Alex Benn=C3=A9e

