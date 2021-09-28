Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B5D41AB8D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 11:11:47 +0200 (CEST)
Received: from localhost ([::1]:55246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV99N-0007TU-1c
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 05:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mV98Q-0006KX-UF; Tue, 28 Sep 2021 05:10:46 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:48719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mV98P-0002ZG-6o; Tue, 28 Sep 2021 05:10:46 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N3sZs-1mvNEO2Ttg-00zkDp; Tue, 28 Sep 2021 11:10:40 +0200
Subject: Re: [PATCH] qemu-options: -chardev reconnect=seconds duplicated in
 help, tidy up
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210928071449.1416022-1-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0d9c1647-c292-042a-67df-c6b74ce91f64@vivier.eu>
Date: Tue, 28 Sep 2021 11:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210928071449.1416022-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jzoVAp0rnS2e4IhgwzQa+Vmss6/3y3exuaxdWJilWDgxTBof++X
 w+Qt7hopClsyMllgiYfRdvEdBfraJ+LzTT60/eek5St3D08zKgePNZMJhYMHyrTJ07+rtQm
 2kWI+Wq1Nr77Ej89YpujUTxaX6MRslCZ650Q57mb3Gsoy/GRvwGYIFAcemnce3tB3a+MGGT
 Oc/pmBn0rvIUY5GxQoIEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vLZGORYPEwQ=:YMcHGtfMbC2b5gP0GnXVCl
 L23KLzFaHgEFk2zcVEIlHWzEXRLkXo0Hj8mPN3LQRM904yXp1dl4kQy/w3INqZo2AIE1/+nw3
 rzuZm1WiQKB+/XPKhN+Bm+oZ4qsnSrm8WZdfEgLNu8+9FDQI5drxZZUQXJb9GGpjYxwa2pqLK
 eQFW7K933JEZLwTZlZul+q3WUkT6BvZWpCUql2A61kk8XTBY7VHw4ZOgoJZmw3KzhGEbxtTXd
 mW3AVkb7RdPRnuaT/gI6NpN1hRzziJqXQ542KWqzWVuO8rl/7tOTh3ssZpC9Hqabx8rlB5GIY
 Qyz4nBMelsVCLW4S+7TYc/0MYS4QT8QqriLx+Oa9iOK4GMXw/bTdeVyvga0BA4w3STTRzzmpW
 KcgIS6Ii+5GhIUs+h3k66Yo7ulTsLOYA3JdgYjK+svq4XUybdm4UATkQo7lY1SiMWWJAOv2rC
 chb7rHg1xIpDe1lZNJoNd75OwMthIh1cWMbzOtqYXujrBZ01rEq+ywu482j4PatDEqiZyqus3
 n6Zo2pabevrOkyH74eh4pTUJfJpoY/uIcNjTWjVxBA/vmtktj5tcDMIa03jwnaygYPau4zDlf
 +vLSZvTTuOO0vrfngWMeTE1VNgU8WvOJHJoM17H8ClsXUK03JzjYkZ/Ob+4tboB7b4EW0EEUj
 Gg+8RPOq+zHMZcEV1gdh9RcpDqxEKQY91Z37WVM8ef7TkHiCVU39E97IqQ9BsdIHX9m9JUe1G
 TAqswcic/heEAYV0ZmHg1klhemtJYb1Mrq1Eug==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.136,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/09/2021 à 09:14, Markus Armbruster a écrit :
> Fixes: 5dd1f02b4bc2f2c2ef3a2adfd8a412c8c8769085
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8f603cc7e6..27e7b9a77c 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3188,7 +3188,7 @@ DEFHEADING(Character device options:)
>  DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
>      "-chardev help\n"
>      "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
> -    "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off][,reconnect=seconds]\n"
> +    "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off]\n"
>      "         [,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds][,mux=on|off]\n"
>      "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
>      "-chardev socket,id=id,path=path[,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds]\n"
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

