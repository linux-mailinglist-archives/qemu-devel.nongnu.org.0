Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590A2D29CF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 14:46:13 +0200 (CEST)
Received: from localhost ([::1]:37602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIXpb-000662-SF
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 08:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57982)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lersek@redhat.com>) id 1iIXdQ-0006Fv-Gq
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:33:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1iIXdP-0001WV-9c
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:33:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46004)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>) id 1iIXdP-0001WJ-3p
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:33:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4C2983086218;
 Thu, 10 Oct 2019 12:33:34 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-48.rdu2.redhat.com
 [10.10.120.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB0465DA8D;
 Thu, 10 Oct 2019 12:33:20 +0000 (UTC)
Subject: Re: [RFC 1/3] acpi: cpuhp: fix 'Command data' description is spec
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20191009132252.17860-1-imammedo@redhat.com>
 <20191009132252.17860-2-imammedo@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <406bde43-fcb5-0043-eabf-69cc494736b4@redhat.com>
Date: Thu, 10 Oct 2019 14:33:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191009132252.17860-2-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 10 Oct 2019 12:33:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/09/19 15:22, Igor Mammedov wrote:
> QEMU returns 0, in case of erro or invalid value in 'Command field',
> make spec match reality, i.e.

Unfinished thought?

> 
> Also fix returned value description  in case 'Command field' == 0x0,

double space

> it's in not PXM but CPU selector value with pending event

suggest dropping "in"

> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  docs/specs/acpi_cpu_hotplug.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
> index ee219c8358..ac5903b2b1 100644
> --- a/docs/specs/acpi_cpu_hotplug.txt
> +++ b/docs/specs/acpi_cpu_hotplug.txt
> @@ -44,9 +44,10 @@ read access:
>             3-7: reserved and should be ignored by OSPM
>      [0x5-0x7] reserved
>      [0x8] Command data: (DWORD access)

since we're fixing this dword field description, can you spell out the
endianness too?

(I think endianness is relevant here, because patch#2 suggests selectors
can be looped over. So selectors are actual integers, not just 32-bit
opaque blobs.)

> -          in case of error or unsupported command reads is 0xFFFFFFFF
> +          in case of error or unsupported command reads is 0x0
>            current 'Command field' value:
> -              0: returns PXM value corresponding to device
> +              0: returns CPU selector value corresponding to a CPU with
> +                 pending event.
>  
>  write access:
>      offset:
> 

Thanks!
Laszlo

