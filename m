Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29725645B9
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:21:23 +0200 (CEST)
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7ur4-0004gi-Lv
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcx4c70@gmail.com>) id 1o7upd-00040e-At
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:19:53 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcx4c70@gmail.com>) id 1o7upb-0004g0-GP
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:19:53 -0400
Received: by mail-pj1-x102a.google.com with SMTP id ju17so1422005pjb.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=egkUuOVLOe7InrjoICLBn4eZVAcizvKX5Nb1Mu72SZE=;
 b=OjExoEEG3Hy1EpUdrPFb9h5wveZ8fsh+CM9R4bhRzmmVmIhXoWGxWRUbIJ9+fxeBnM
 A3K5uWUVLNM/XIKlOFy7KVje9es4AE/UEQ5iMogtG9W7UsZjavwlPAY+8bqrfxNYDUdB
 y6BqPf27+drSAmE143ITDmAKYZOG+HUDOjjAcEOCGnEKQ1Piqth4vIpZ72zBNP7jKLou
 xG5t/2cNBh6mRO3Y83FDL6G9Ki2xaDCZAqJtp3+lJPAn2veofFXzoENRdtZkO9aYWbe/
 hDVFCEM6NaUi2UxY0SefxKXZ1lZTMYPDENjTxjKPj4QChRwcYIlkVkGvDeB9nBYhO7uQ
 ZGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=egkUuOVLOe7InrjoICLBn4eZVAcizvKX5Nb1Mu72SZE=;
 b=lJIUkQn9XKFsdPPDOODPD5bXtEeOzjbQc6bpsqvWM8q/zHfS7Q3/eZ2uEV0hEUwXNE
 w1pyfQMcm7/kBvzKcoGD78tBmDetMhX4TduoJqo9e8no6Ef8R+LOipWe/joDW6bQG2nO
 dnLdkulsAqP7P42tNp5kk9RtoXYw6oaVrnhlp5Sqg1E3MsAMXtBraFh0bMk04Gm+QjH4
 tz9tf1xTn9ASuvZtnCiC0xD0J4L8junSmvNb/yPzPvhV6+W9PXyanLdYWAs9W2DYBYPL
 BfTGgiTgP43DiARq5PhQKk7rAe6wTNC3cJSBaQcBO1tt9/OOdLoYZBvrrLpeDYg8CSp/
 qarA==
X-Gm-Message-State: AJIora+nnKz0Zb2/xKruH+5ogzrr/8UnEOygxsgSFpoYpKtiXbCJJfxA
 KejaCbnOvc/k6Yf2EPXPQj8=
X-Google-Smtp-Source: AGRyM1s/AsL6yeYH3+MCxed51ktcJgfeYAybJcpxrWT1tJw0+ot/ngliv9+EvZKPLLMZ8JvM3BOuhg==
X-Received: by 2002:a17:90b:1a81:b0:1ed:3c0:3abb with SMTP id
 ng1-20020a17090b1a8100b001ed03c03abbmr28034393pjb.5.1656836390072; 
 Sun, 03 Jul 2022 01:19:50 -0700 (PDT)
Received: from ?IPV6:2404:f801:0:5::ce? ([2404:f801:9000:18:6fec::ce])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a170903111000b0016bdd124d46sm596533plh.288.2022.07.03.01.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 01:19:49 -0700 (PDT)
Message-ID: <1c909c0d-6d99-cbb9-0f2a-8186e716fd5d@gmail.com>
Date: Sun, 3 Jul 2022 16:19:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH V8 36/39] chardev: cpr for sockets
Content-Language: en-US
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Mark Kanda <mark.kanda@oracle.com>,
 Guoyi Tu <tugy@chinatelecom.cn>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-37-git-send-email-steven.sistare@oracle.com>
From: Peng Liang <tcx4c70@gmail.com>
In-Reply-To: <1655304746-102776-37-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=tcx4c70@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/15/2022 10:52 PM, Steve Sistare wrote:
> Save accepted socket fds before cpr-save, and look for them after cpr-load.
> Block cpr-exec if a socket enables the TLS or websocket option.  Allow a
> monitor socket by closing it on exec.
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  chardev/char-socket.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
>  include/chardev/char-socket.h |  1 +
>  monitor/hmp.c                 |  3 +++
>  monitor/qmp.c                 |  3 +++
>  4 files changed, 52 insertions(+)
> 
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index dc4e218..3a1e36b 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -26,6 +26,7 @@
>  #include "chardev/char.h"
>  #include "io/channel-socket.h"
>  #include "io/channel-websock.h"
> +#include "migration/cpr.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qemu/option.h"
> @@ -33,6 +34,7 @@
>  #include "qapi/clone-visitor.h"
>  #include "qapi/qapi-visit-sockets.h"
>  #include "qemu/yank.h"
> +#include "sysemu/sysemu.h"
>  
>  #include "chardev/char-io.h"
>  #include "chardev/char-socket.h"
> @@ -358,6 +360,11 @@ static void tcp_chr_free_connection(Chardev *chr)
>      SocketChardev *s = SOCKET_CHARDEV(chr);
>      int i;
>  
> +    if (chr->cpr_enabled) {
> +        cpr_delete_fd(chr->label, 0);
> +    }
> +    cpr_del_blocker(&s->cpr_blocker);
> +
>      if (s->read_msgfds_num) {
>          for (i = 0; i < s->read_msgfds_num; i++) {
>              close(s->read_msgfds[i]);
> @@ -923,6 +930,10 @@ static void tcp_chr_accept(QIONetListener *listener,
>                                 QIO_CHANNEL(cioc));
>      }
>      tcp_chr_new_client(chr, cioc);
> +
> +    if (s->sioc && chr->cpr_enabled) {
> +        cpr_resave_fd(chr->label, 0, s->sioc->fd, NULL);
> +    }
>  }
>  
>  
> @@ -1178,6 +1189,26 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
>      return false;
>  }
>  
> +static int load_char_socket_fd(Chardev *chr, Error **errp)
> +{
> +    SocketChardev *sockchar = SOCKET_CHARDEV(chr);
> +    QIOChannelSocket *sioc;
> +    const char *label = chr->label;
> +    int fd = cpr_find_fd(label, 0);
> +
> +    if (fd != -1) {
> +        sockchar = SOCKET_CHARDEV(chr);
> +        sioc = qio_channel_socket_new_fd(fd, errp);
> +        if (sioc) {
> +            tcp_chr_accept(sockchar->listener, sioc, chr);
> +            object_unref(OBJECT(sioc));
> +        } else {
> +            error_setg(errp, "could not restore socket for %s", label);

If we go here, then qio_channel_socket_new_fd fails and errp should be set. So I think
error_prepend is more appropriate here.

> +            return -1;
> +        }
> +    }
> +    return 0;
> +}
>  
>  static int qmp_chardev_open_socket_server(Chardev *chr,
>                                            bool is_telnet,
> @@ -1388,6 +1419,18 @@ static void qmp_chardev_open_socket(Chardev *chr,
>      }
>      s->registered_yank = true;
>  
> +    if (!s->tls_creds && !s->is_websock) {
> +        qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
> +    } else if (!chr->reopen_on_cpr) {
> +        s->cpr_blocker = NULL;
> +        error_setg(&s->cpr_blocker,
> +                   "error: socket %s is not cpr capable due to %s option",
> +                   chr->label, (s->tls_creds ? "TLS" : "websocket"));
> +        if (cpr_add_blocker(&s->cpr_blocker, errp, CPR_MODE_RESTART, 0)) {
> +            return;
> +        }
> +    }
> +
>      /* be isn't opened until we get a connection */
>      *be_opened = false;
>  
> @@ -1403,6 +1446,8 @@ static void qmp_chardev_open_socket(Chardev *chr,
>              return;
>          }
>      }
> +
> +    load_char_socket_fd(chr, errp);
>  }
>  
>  static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
> diff --git a/include/chardev/char-socket.h b/include/chardev/char-socket.h
> index 0708ca6..1c3abf7 100644
> --- a/include/chardev/char-socket.h
> +++ b/include/chardev/char-socket.h
> @@ -78,6 +78,7 @@ struct SocketChardev {
>      bool connect_err_reported;
>  
>      QIOTask *connect_task;
> +    Error *cpr_blocker;
>  };
>  typedef struct SocketChardev SocketChardev;
>  
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 15ca047..75e6739 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -1501,4 +1501,7 @@ void monitor_init_hmp(Chardev *chr, bool use_readline, Error **errp)
>      qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read, monitor_read,
>                               monitor_event, NULL, &mon->common, NULL, true);
>      monitor_list_append(&mon->common);
> +
> +    /* monitor cannot yet be preserved across cpr */
> +    chr->reopen_on_cpr = true;
>  }
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 092c527..0043459 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -535,4 +535,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
>                                   NULL, &mon->common, NULL, true);
>          monitor_list_append(&mon->common);
>      }
> +
> +    /* Monitor cannot yet be preserved across cpr */
> +    chr->reopen_on_cpr = true;
>  }

