Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8DF322083
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:53:41 +0100 (CET)
Received: from localhost ([::1]:41578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEHH2-0003uk-Iy
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEHCz-00013j-Gp
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 14:49:29 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEHCt-0005tQ-Rz
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 14:49:29 -0500
Received: by mail-wr1-x434.google.com with SMTP id b3so20322711wrj.5
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 11:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5wnJgrLRVnC64EH9pE8dLWdOYGnlja4l0LJiNzmd5mA=;
 b=dLY5kKRQtu4TqbZ/HDv1DujM/Q4PRte1jCXlqCjhJi+C3ZU4JLmuL2AbCljokPc1+h
 Ql/p6c/K0APgNzfydpiwX+ieYOxzt5BzZuCsQl/sNRDOuDJE3AQPNw2uSm9DyQdS9Ifz
 zn5s8F0Ojtfo/DP4HkUUk7lzI6UHaMZhsFmIT1iT6stVmBkzyGDnnj+PZd7zkQmjcBkl
 671J4w4GNA6vZSppwu0LyxDngMDOQ0awmEAKE7ZnDK5N9wTIvZOkGGMJsOJdtIwQiIlb
 vzxkcUwgcFJovZ8xksM+GjbG3i7RvdbeE6mpsXJZRX7yO58PkV9zkaAaKRUW1X9rw+Xx
 EARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5wnJgrLRVnC64EH9pE8dLWdOYGnlja4l0LJiNzmd5mA=;
 b=QS8KDjl9ZtrtC9xlNjoWHMRLE1WQnu2opLnDrjuOtFHOiBTmK92wMwkztWgXDWGCb6
 y/VIKas0rg435l9pUSak6Vri7MH19h+39ArWggTLiOvyRO1GnwqWGDSw1s/VNiEYXsIT
 ljTXCx+ULXfy6fddP3egP1Z48gDpxZLrfJ8TYTa9FUKUwXnEdlveFTQoiKhHtRpzVrE+
 ysWR6+ZMDUwmwlpoTkdcbcg3aGR0ejSDcth75fMwcEowGI9XsIccqqLgg0K9MtU5R53B
 2zbRGMQEOFKgQvTHJa9BjbZvVCDmTw1mhDG+jYc2lU+ixqeL9SCZfBTm5qi4yL6XkW7T
 DT3Q==
X-Gm-Message-State: AOAM532KC4OTKP6j5dt1T0YmMuOI+sBHhs0YoPD9nydocF//f4naboRk
 Gi2tpmPJEUNHI90Y7raqBpPOKA==
X-Google-Smtp-Source: ABdhPJwD+NZEd1eMberM14+Ie1QA7l/SNq7Aq0Es+8Mcv/MXRscqO3z+o99cPwCXPMak46+gyg5NIw==
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr23543978wrv.111.1614023362143; 
 Mon, 22 Feb 2021 11:49:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w4sm329320wmc.13.2021.02.22.11.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 11:49:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D3FA1FF7E;
 Mon, 22 Feb 2021 19:49:20 +0000 (GMT)
References: <YDPk08PCwhD7Nm2+@strawberry.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Plugin Address Translations Inconsistent/Incorrect?
Date: Mon, 22 Feb 2021 19:30:04 +0000
In-reply-to: <YDPk08PCwhD7Nm2+@strawberry.localdomain>
Message-ID: <8735xn6fy7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

> Hello,
>
> I've been doing some more work with plugins and found something I didn't
> expect with regards to address translation.
>
> If I call (inside a memory callback):
>
> `uint64_t pa =3D qemu_plugin_hwaddr_device_offset(hwaddr);`
>
> I see that `pa` takes the value 0xe0e58760. If, however, I plumb
> `cpu_get_phys_page_debug` through to the plugin interface and call it
> like:
>
> `pa =3D cpu_get_phys_page_debug(current_cpu, va);`
>
> I see it takes the value 0x120e58760.
>
> I notice that 0x120e58760-0xe0e58760 is exactly one gigabyte, which is
> also the offset of the beginning of RAM for the 'virt' AArch64 machine
> I'm using. Furthermore, I see the name of the plugin function includes
> "device_offset", so perhaps this discrepancy is by design. However, it
> seems awkward to not be able to get a true physical address.

It certainly is by design. The comment for the helper states:

  /*
   * The following additional queries can be run on the hwaddr structure
   * to return information about it. For non-IO accesses the device
   * offset will be into the appropriate block of RAM.
   */

> I've done some digging and found that inside `qemu_ram_addr_from_host`
> (called by `qemu_plugin_hwaddr_device_offset`), `block->mr->addr`
> appears to hold the offset of the beginning of RAM.=20
>
> Do you think it would be reasonable to modify
> `qemu_plugin_hwaddr_device_offset` to add the beginning of the RAM block
> or otherwise return the true physical address (or at least expose a way
> to find the beginning of it through the plugin interface)?

Well the problem here is what is the address map? For example if you
have a secure block of RAM you might have two physical addresses which
are the same. That said with the current qemu_plugin_hwaddr_device_name
helper both will get reported as "RAM" so maybe it's not that helpful
yet.

I also worry about what happens if devices get moved around. Do you end
up with aliasing of address space have a remap of the HW.

That said I think we could add an additional helper to translate a
hwaddr to a global address space address. I'm open to suggestions of the
best way to structure this.

>
> Thanks!
>
> -Aaron


--=20
Alex Benn=C3=A9e

