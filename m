Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE6F1B65B3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 22:47:11 +0200 (CEST)
Received: from localhost ([::1]:41224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRikX-0000Ds-Un
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 16:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60440)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRiiU-0007mL-Nc
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 16:45:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRiiT-00054H-IW
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 16:45:02 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRiiT-00052p-5j
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 16:45:01 -0400
Received: by mail-wr1-x442.google.com with SMTP id t14so8232132wrw.12
 for <qemu-devel@nongnu.org>; Thu, 23 Apr 2020 13:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nw7m+QtqQ68L20g6rF5jyp/MkzoNexySjUrYPBeIGuE=;
 b=h4LfPsZHBjL26FooeyLMYHnfhYQbn/zbTUee7X3agl0r2/A4f1XhLcmINa3sspWL+T
 5Ipg5VaSQH73EWy1FcglyR13qQUINb8QCT49TTok/9qg712FA9ejuGxQXZAMpnlyx+ru
 CNC8QGODF0hhcAxd6MUGI+YZwYUlY6V1WnAGbUsedl0deOLY35RDKOQAHLCVwY8qWqrc
 lrvuxJPNoSIEmO5agGP96Yk69YxYURMffjuS/Vn4/lupa/7Wf1YEoqjDmdaXz3Z960vw
 2o3eeSzEiZIpc02Ex2XtiHIvrQoiZSQ1/Xv/Sak1gZYg5ewH4JWI2A1dbvqCHe44g93+
 +nRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nw7m+QtqQ68L20g6rF5jyp/MkzoNexySjUrYPBeIGuE=;
 b=NPKUTdceSsyIdjNiOrqn7VaQH1dwCoBDh6KqNzj95t42NUlbCxwrFPrZpnRSGTJ9l8
 ACTSO56qonHGwqDpW74iXewXvugd4of3a8Yct8P2G8JOpIU+7Hq0paaPwfLiZHGhS5s8
 7hUF49eGl1+gFgyDK/HrxCnu2LV2zRRAnSfMeaOFoqWmPy/OpvJJNISvHQxuiK7ys1XI
 kCObIhJryDAABCfkyQkSG8OXbs2QYb0KBK2mzQDq9K0StQRxuUguWHbfKCoZy5+mo9dD
 4UJd3CdeaKI+DMiSxw3pb0O0NI4MnZEi6luPSHftU05rF3Odf3amuUcfVNwfn9o7IpGx
 ttBg==
X-Gm-Message-State: AGi0PuaA7VNmE6jXvrXEmPXkgjcc6x5zJZ+7hZf6SYvjOvNxriUVBE/i
 hvq55umyOqtV0qEEBA/gnqG9NB28
X-Google-Smtp-Source: APiQypLeYmXftCcszY1nYS7/ARXWgeWmHsJdPmykc0V8ak1gzgKcgMBU49pAJrHYyb0iK8+GIbBgLg==
X-Received: by 2002:a5d:60ca:: with SMTP id x10mr6824420wrt.407.1587674698270; 
 Thu, 23 Apr 2020 13:44:58 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id l5sm4946231wmi.22.2020.04.23.13.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 13:44:57 -0700 (PDT)
Subject: Re: Need BT support in qemu for Zephyr
To: Dan Christian <dchristian@cardinalpeak.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <CADxL6wUGWZO0U=G7UTAebG57m6tG58hoMf_-TCC+0qReUB0G6w@mail.gmail.com>
 <20200423141112.GE1077680@redhat.com>
 <CADxL6wX-0Lt_LKT9pQMiK3Y1L0tdrF9G23dfYU=9FXgFZB-4Fw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <455cf375-fe21-f5c4-6086-4413bf710d33@amsat.org>
Date: Thu, 23 Apr 2020 22:44:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CADxL6wX-0Lt_LKT9pQMiK3Y1L0tdrF9G23dfYU=9FXgFZB-4Fw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::442
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/20 4:40 PM, Dan Christian wrote:
> I'm new to trying to use qemu+bt (via btproxy) and haven't managed to
> get anything working.
> 
> btproxy is launched first, then Zephyr launches qemu via it's west
> tool.  The commands look like:
> sudo tools/btproxy -u -i 0 -d # in a separate window
> x86_64-pokysdk-linux/usr/bin/qemu-system-aarch64 -cpu cortex-a53
> -nographic -machine virt -
> net none -pidfile qemu.pid -chardev stdio,id=con,mux=on -serial
> chardev:con -mon chardev=con,mode=readline -serial
> unix:/tmp/bt-server-bredr -kernel
> /home/dchristian/share-fb/zephyrproject/zephy
> r/build/zephyr/zephyr.elf
> 
> It's failing with a device busy when btproxy tries to bind to the
> adapter.  I don't think this is a quemu issue.
> 
> Zephyr packages it's own qemu:  QEMU emulator version 4.2.0 (v4.2.0-dirty)

If you just want to test/use BT, you might be luckier with an older
version of QEMU supposed to work with BT, such QEMU v1.0. You won't have
support for Cortex-A53 although.

