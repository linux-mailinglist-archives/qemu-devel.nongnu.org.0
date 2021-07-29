Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A4F3D9C76
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 06:05:36 +0200 (CEST)
Received: from localhost ([::1]:46462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8xIc-0008Go-MU
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 00:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1m8xHN-0007bP-TX
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 00:04:18 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1m8xHK-0005wr-Cs
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 00:04:17 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GZxdd12M8zcjkp;
 Thu, 29 Jul 2021 12:00:37 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 12:04:06 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 12:04:04 +0800
Subject: Re: [PATCH V5 23/25] chardev: cpr for sockets
To: Steve Sistare <steven.sistare@oracle.com>, <qemu-devel@nongnu.org>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-24-git-send-email-steven.sistare@oracle.com>
From: Zheng Chuan <zhengchuan@huawei.com>
Message-ID: <e68f3317-8be4-cae1-f4ac-cbdbe346fbb1@huawei.com>
Date: Thu, 29 Jul 2021 12:04:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1625678434-240960-24-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=zhengchuan@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric
 Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alex
 Williamson <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi.

On 2021/7/8 1:20, Steve Sistare wrote:
> Save accepted socket fds in the environment before cprsave, and look for
> fds in the environment after cprload.  Reject cprexec if a socket enables
> the TLS or websocket option.  Allow a monitor socket by closing it on exec.
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  chardev/char-socket.c | 31 +++++++++++++++++++++++++++++++
>  monitor/hmp.c         |  3 +++
>  monitor/qmp.c         |  3 +++
>  3 files changed, 37 insertions(+)
> 
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index d0fb545..dc9da8c 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -27,7 +27,9 @@
>  #include "io/channel-socket.h"
>  #include "io/channel-tls.h"
>  #include "io/channel-websock.h"
> +#include "qemu/env.h"
>  #include "io/net-listener.h"
> +#include "qemu/env.h"
duplicated include.

>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qemu/option.h"
> @@ -414,6 +416,7 @@ static void tcp_chr_free_connection(Chardev *chr)
>      SocketChardev *s = SOCKET_CHARDEV(chr);
>      int i;
>  
> +    unsetenv_fd(chr->label);
>      if (s->read_msgfds_num) {
>          for (i = 0; i < s->read_msgfds_num; i++) {
>              close(s->read_msgfds[i]);
> @@ -976,6 +979,10 @@ static void tcp_chr_accept(QIONetListener *listener,
>                                 QIO_CHANNEL(cioc));
>      }
>      tcp_chr_new_client(chr, cioc);
> +
> +    if (s->sioc && !chr->close_on_cpr) {
> +        setenv_fd(chr->label, s->sioc->fd);
> +    }
>  }
>  
>  
> @@ -1231,6 +1238,24 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
>      return false;
>  }
>  
> +static void load_char_socket_fd(Chardev *chr, Error **errp)
> +{
> +    SocketChardev *sockchar = SOCKET_CHARDEV(chr);
> +    QIOChannelSocket *sioc;
> +    int fd = getenv_fd(chr->label);
> +
> +    if (fd != -1) {
> +        sockchar = SOCKET_CHARDEV(chr);
> +        sioc = qio_channel_socket_new_fd(fd, errp);
> +        if (sioc) {
> +            tcp_chr_accept(sockchar->listener, sioc, chr);
> +            object_unref(OBJECT(sioc));
> +        } else {
> +            error_setg(errp, "error: could not restore socket for %s",
> +                       chr->label);
> +        }
> +    }
> +}
>  
>  static int qmp_chardev_open_socket_server(Chardev *chr,
>                                            bool is_telnet,
> @@ -1435,6 +1460,10 @@ static void qmp_chardev_open_socket(Chardev *chr,
>      }
>      s->registered_yank = true;
>  
> +    if (!s->tls_creds && !s->is_websock) {
> +        qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
> +    }
> +
>      /* be isn't opened until we get a connection */
>      *be_opened = false;
>  
> @@ -1450,6 +1479,8 @@ static void qmp_chardev_open_socket(Chardev *chr,
>              return;
>          }
>      }
> +
> +    load_char_socket_fd(chr, errp);
>  }
>  
>  static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 6c0b33a..63700b3 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -1451,4 +1451,7 @@ void monitor_init_hmp(Chardev *chr, bool use_readline, Error **errp)
>      qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read, monitor_read,
>                               monitor_event, NULL, &mon->common, NULL, true);
>      monitor_list_append(&mon->common);
> +
> +    /* monitor cannot yet be preserved across cpr */
> +    chr->close_on_cpr = true;
>  }
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 092c527..21a90bf 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -535,4 +535,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
>                                   NULL, &mon->common, NULL, true);
>          monitor_list_append(&mon->common);
>      }
> +
> +    /* Monitor cannot yet be preserved across cpr */
> +    chr->close_on_cpr = true;
>  }
> 

-- 
Regards.
Chuan

