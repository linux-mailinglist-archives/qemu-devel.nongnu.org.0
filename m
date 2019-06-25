Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F0E54D1E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 13:03:10 +0200 (CEST)
Received: from localhost ([::1]:58764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfjED-0002tq-VU
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 07:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46223)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hfjCQ-0002HY-Jc
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 07:01:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hfjCH-0002Vw-UD
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 07:01:13 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39286)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hfjCH-0002Ld-KT
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 07:01:09 -0400
Received: by mail-wr1-f67.google.com with SMTP id x4so17331798wrt.6
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 04:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AgfgO419ofIiX+/9TzxRknBJ7xrFbA7ucidrBs8Tfco=;
 b=UII08wqY99i78rXpYySjmpH6Bo2blnDSe92giPjigmiWrWiJwCTQJKvhQVWKYXgF9R
 WNdFp11fi3yjz9PR6bEbdTVEL5PaoDvLdJbPOVsxzLPyUnViSB9YBweAGoL6rI/CfuH9
 scm3sc4G7oSBe9eW0saLznyQ+tsoKU1O7N+0eqZS60s7a/owg2oCqfS/p6jDeIEQBYw1
 NyLuhnegejPZqTlM5SSqtqs0xjyK/RDKSbDbXMMZwpglCn/ToroXLObMbf4fImGqAdCt
 3QfgBxJdcUBfKSa4RH16tI/60d1Dfo48ccbTsOSDFCUCsVJC71SIxlIUPD1UBmace6FS
 2kaQ==
X-Gm-Message-State: APjAAAW7PjF2Y7I1rFoHi3mH4nghIEItDd3wPxzk3GTBvONbBQz/ocds
 52NyogMItS88DTeaulUPFdTuoA==
X-Google-Smtp-Source: APXvYqw7RF5Q70855RiCnmbUkXA1L6hzSbDq1hGS4GL9dc0gLcOjU5cffBLGMBwb3sBCuYCYtjeHqQ==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr40109867wrv.45.1561460460815; 
 Tue, 25 Jun 2019 04:01:00 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id 35sm16315559wrj.87.2019.06.25.04.01.00
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 04:01:00 -0700 (PDT)
To: Christophe de Dinechin <dinechin@redhat.com>, qemu-devel@nongnu.org
References: <4C5F8F98-D058-46A4-81E7-D9A5D4FEE2EC@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d4b9b921-018a-c7cc-c95a-6fc5e0b02a26@redhat.com>
Date: Tue, 25 Jun 2019 13:00:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4C5F8F98-D058-46A4-81E7-D9A5D4FEE2EC@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH] Fix build error when VNC is configured out
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Christophe,

On 6/25/19 11:24 AM, Christophe de Dinechin wrote:
> In hmp_change(), the variable hmp_mon is only used
> by code under #ifdef CONFIG_VNC. This results in a build
> error when VNC is configured out with the default of
> treating warnings as errors:
> 
> monitor/hmp-cmds.c: In function ‘hmp_change’:
> monitor/hmp-cmds.c:1946:17: error: unused variable ‘hmp_mon’ [-Werror=unused-variable]
> 1946 |     MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
>      |                 ^~~~~~~
> 
> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
> ---
>  monitor/hmp-cmds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index c283dde0e9..038614da8e 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1943,7 +1943,6 @@ static void hmp_change_read_arg(void *opaque, const char *password,
>  
>  void hmp_change(Monitor *mon, const QDict *qdict)
>  {
> -    MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
>      const char *device = qdict_get_str(qdict, "device");
>      const char *target = qdict_get_str(qdict, "target");
>      const char *arg = qdict_get_try_str(qdict, "arg");
> @@ -1952,6 +1951,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>      Error *err = NULL;
>  
>  #ifdef CONFIG_VNC
> +    MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);

Can you move it after 'if (!arg) {', the sole place where it is used?

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>      if (strcmp(device, "vnc") == 0) {
>          if (read_only) {
>              monitor_printf(mon,
> 

